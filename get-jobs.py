import sys
from pathlib import Path
import argparse
import shutil

def create_cmake_dir(base_dir, out_fname, in_fname):
    print(out_fname)
    out_dir = base_dir / out_fname.parent / out_fname.stem
    print(f"creating {out_dir}")
    out_dir.mkdir(parents=True, exist_ok=True)


    name = out_fname.stem
    cmakelists = out_dir / "CMakeLists.txt"
    cmakelists.write_text(f'attach_bc_link({name} {name}.ll)\nadd_btor_test({name})\n')

    shutil.copy2(in_fname, out_dir)

def main():
    parser = argparse.ArgumentParser(
                    prog = 'mk_cmake',
                    description = 'creates build system for Joseph',
                    epilog = 'Have a good day')
    parser.add_argument("in_dir", help="Directory for btor files")
    parser.add_argument("out_dir",help="Output directory")
    args = parser.parse_args()


    print(f"Looking for btor files in {args.in_dir}")
    print(f"Writing results to {args.out_dir}")

    in_dir = Path(args.in_dir) 
    assert(in_dir.is_dir())
    out_dir = Path(args.out_dir)

    if not out_dir.is_dir():
        out_dir.mkdir(parents=True)

    assert(out_dir.is_dir())

    in_files = in_dir.glob('**/*.ll')
    for in_fname in in_files:
        out_fname = in_fname.relative_to(in_dir)
        create_cmake_dir(out_dir, out_fname, in_fname)



    return 0

if __name__ == '__main__':
    sys.exit(main())
