import webpack from "webpack";

interface TSStuff {
  blah: boolean;
}

const a: TSStuff = {
  blah: true,
};

if (a.blah) {
  console.log(webpack);
  console.log("Yay it works!");
}
