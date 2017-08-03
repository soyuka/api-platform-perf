<?php

namespace AppBundle\Command;

use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use AppBundle\Entity\Foo;
use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;

class FooCommand extends ContainerAwareCommand
{
    protected function configure() {
        $this->setName('app:foo');
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $doctrine = $this->getContainer()->get('doctrine');

        $manager = $doctrine->getManagerForClass(Foo::class);

        $i = 9000;

        while(--$i) {
            $f = new Foo();
            $f->setBar((string) mt_rand());
            $manager->persist($f);
        }

        $manager->flush();
    }
}
