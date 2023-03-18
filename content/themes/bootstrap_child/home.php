<main class="">

    <!-- Do Carousel -->
    <?php
        $carousel = new Carousel;
        $carousel->do_carousel();
    ?>

    <div class="container my-4 my-lg-5 text-justify">
        <div class="row justify-content-center">
            <div class="col-11 col-lg-10">
                <?=isset($page_data) ? $page_data['content'] : ''; ?>
            </div>
        </div>
    </div>

</main>