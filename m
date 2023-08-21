Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42D9A782EDD
	for <lists+linux-input@lfdr.de>; Mon, 21 Aug 2023 18:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233005AbjHUQ5K (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Aug 2023 12:57:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbjHUQ5J (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Aug 2023 12:57:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDC4FCC;
        Mon, 21 Aug 2023 09:57:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7AEBA620E7;
        Mon, 21 Aug 2023 16:57:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F27F2C433C7;
        Mon, 21 Aug 2023 16:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692637026;
        bh=i8IrBp7/HLyTFHbC69jSpFmcFIBFJyF3Vziss3EeCe4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HHIMgEWmGNfDcZBmcXD9UfsrlvKu63w+opGyTlHcvTC+YLKcTH2gUyQptjiJCgf3K
         pU1OwCK6g/0HC/D79iWLOXF4RYJ8vLb/6wSyzdhwhmAcgEGwnPtkB+jPgBhu9W0v0w
         5lEsbse2bYVvxtVEziFBlZkogDWZzz1+FNQBElODaLYaH6vMzQUAJhtN1PZtZEDhho
         zaP2H5VSk8stBNv3M6Ak/deeZqAviJF4QhWic/1dgHG+ZVQp46Zw5raJeHODz7RIkY
         2Ihsva922YZCAvBE66Jf0LAjOfa3bX10SZ1ryvBb5Rh0bFSDilpFmTjJTds/ZaF4kT
         wrsu9LnxvdTJQ==
Date:   Mon, 21 Aug 2023 18:57:00 +0200
From:   Benjamin Tissoires <bentiss@kernel.org>
To:     Doug Anderson <dianders@google.com>
Cc:     Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        benjamin.tissoires@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        dmitry.torokhov@gmail.com, jikos@kernel.org, hsinyi@google.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] HID: i2c-hid: elan: Add ili9882t timing
Message-ID: <xvrraazybsoqzdnmuk6y75lypm75gsll6zygd6jdl7zarbqsfo@tfqfnovhgoh5>
References: <20230802071947.1683318-1-yangcong5@huaqin.corp-partner.google.com>
 <20230802071947.1683318-3-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=Um8875aMt_kWvCvpNjb3EwSk8VjVTEgv_TJ9WDS+LniA@mail.gmail.com>
 <lyns4qkh57xhppnqroaooqtniypfsmr2l5fujlry3stmhrjww4@3iy5mmmrazl6>
 <CAD=FV=UFM-5XFsTRt7LPXsN9Fjff33khYGQM+XqcLF1YdsRY4Q@mail.gmail.com>
 <dqom52gdxgsglhkfrl43peoh2lw2npmx6libdeulmyi67nszat@vqlvijq5mld7>
 <CAD=FV=Wd61CbcVuHwVwZiGRWb52iVR0u4Vfc8r319j+KumFKqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Wd61CbcVuHwVwZiGRWb52iVR0u4Vfc8r319j+KumFKqg@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Aug 21 2023, Doug Anderson wrote:
> Hi,
> 
> On Mon, Aug 21, 2023 at 7:14 AM Benjamin Tissoires <bentiss@kernel.org> wrote:
> >
> > On Aug 21 2023, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Mon, Aug 21, 2023 at 2:01 AM Benjamin Tissoires <bentiss@kernel.org> wrote:
> > > >
> > > > On Aug 02 2023, Doug Anderson wrote:
> > > > > Benjamin,
> > > > >
> > > > > On Wed, Aug 2, 2023 at 12:20 AM Cong Yang
> > > > > <yangcong5@huaqin.corp-partner.google.com> wrote:
> > > > > >
> > > > > > The ili9882t is a TDDI IC (Touch with Display Driver). The
> > > > > > datasheet specifies there should be 60ms between touch SDA
> > > > > > sleep and panel RESX. Doug's series[1] allows panels and
> > > > > > touchscreens to power on/off together, so we can add the 65 ms
> > > > > > delay in i2c_hid_core_suspend before panel_unprepare.
> > > > > >
> > > > > > Because ili9882t touchscrgeen is a panel follower, and
> > > > > > needs to use vccio-supply instead of vcc33-supply, so set
> > > > > > it NULL to ili9882t_chip_data, then not use vcc33 regulator.
> > > > > >
> > > > > > [1]: https://lore.kernel.org/all/20230727171750.633410-1-dianders@chromium.org
> > > > > >
> > > > > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > > > > > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > > > > > ---
> > > > > >  drivers/hid/i2c-hid/i2c-hid-of-elan.c | 50 ++++++++++++++++++++-------
> > > > > >  1 file changed, 38 insertions(+), 12 deletions(-)
> > > > >
> > > > >
> > > > > >
> > > > > > diff --git a/drivers/hid/i2c-hid/i2c-hid-of-elan.c b/drivers/hid/i2c-hid/i2c-hid-of-elan.c
> > > > > > index 029045d9661c..31abab57ad44 100644
> > > > > > --- a/drivers/hid/i2c-hid/i2c-hid-of-elan.c
> > > > > > +++ b/drivers/hid/i2c-hid/i2c-hid-of-elan.c
> > > > > > @@ -18,9 +18,11 @@
> > > > > >  #include "i2c-hid.h"
> > > > > >
> > > > > >  struct elan_i2c_hid_chip_data {
> > > > > > -       unsigned int post_gpio_reset_delay_ms;
> > > > > > +       unsigned int post_gpio_reset_on_delay_ms;
> > > > > > +       unsigned int post_gpio_reset_off_delay_ms;
> > > > > >         unsigned int post_power_delay_ms;
> > > > > >         u16 hid_descriptor_address;
> > > > > > +       const char *main_supply_name;
> > > > > >  };
> > > > > >
> > > > > >  struct i2c_hid_of_elan {
> > > > > > @@ -38,9 +40,11 @@ static int elan_i2c_hid_power_up(struct i2chid_ops *ops)
> > > > > >                 container_of(ops, struct i2c_hid_of_elan, ops);
> > > > > >         int ret;
> > > > > >
> > > > > > -       ret = regulator_enable(ihid_elan->vcc33);
> > > > > > -       if (ret)
> > > > > > -               return ret;
> > > > > > +       if (ihid_elan->vcc33) {
> > > > > > +               ret = regulator_enable(ihid_elan->vcc33);
> > > > > > +               if (ret)
> > > > > > +                       return ret;
> > > > > > +       }
> > > > > >
> > > > > >         ret = regulator_enable(ihid_elan->vccio);
> > > > > >         if (ret) {
> > > > > > @@ -52,8 +56,8 @@ static int elan_i2c_hid_power_up(struct i2chid_ops *ops)
> > > > > >                 msleep(ihid_elan->chip_data->post_power_delay_ms);
> > > > > >
> > > > > >         gpiod_set_value_cansleep(ihid_elan->reset_gpio, 0);
> > > > > > -       if (ihid_elan->chip_data->post_gpio_reset_delay_ms)
> > > > > > -               msleep(ihid_elan->chip_data->post_gpio_reset_delay_ms);
> > > > > > +       if (ihid_elan->chip_data->post_gpio_reset_on_delay_ms)
> > > > > > +               msleep(ihid_elan->chip_data->post_gpio_reset_on_delay_ms);
> > > > > >
> > > > > >         return 0;
> > > > > >  }
> > > > > > @@ -64,8 +68,12 @@ static void elan_i2c_hid_power_down(struct i2chid_ops *ops)
> > > > > >                 container_of(ops, struct i2c_hid_of_elan, ops);
> > > > > >
> > > > > >         gpiod_set_value_cansleep(ihid_elan->reset_gpio, 1);
> > > > > > +       if (ihid_elan->chip_data->post_gpio_reset_off_delay_ms)
> > > > > > +               msleep(ihid_elan->chip_data->post_gpio_reset_off_delay_ms);
> > > > > > +
> > > > > >         regulator_disable(ihid_elan->vccio);
> > > > > > -       regulator_disable(ihid_elan->vcc33);
> > > > > > +       if (ihid_elan->vcc33)
> > > > > > +               regulator_disable(ihid_elan->vcc33);
> > > > > >  }
> > > > > >
> > > > > >  static int i2c_hid_of_elan_probe(struct i2c_client *client)
> > > > > > @@ -89,24 +97,42 @@ static int i2c_hid_of_elan_probe(struct i2c_client *client)
> > > > > >         if (IS_ERR(ihid_elan->vccio))
> > > > > >                 return PTR_ERR(ihid_elan->vccio);
> > > > > >
> > > > > > -       ihid_elan->vcc33 = devm_regulator_get(&client->dev, "vcc33");
> > > > > > -       if (IS_ERR(ihid_elan->vcc33))
> > > > > > -               return PTR_ERR(ihid_elan->vcc33);
> > > > > > -
> > > > > >         ihid_elan->chip_data = device_get_match_data(&client->dev);
> > > > > >
> > > > > > +       if (ihid_elan->chip_data->main_supply_name) {
> > > > > > +               ihid_elan->vcc33 = devm_regulator_get(&client->dev,
> > > > > > +                                                     ihid_elan->chip_data->main_supply_name);
> > > > > > +               if (IS_ERR(ihid_elan->vcc33))
> > > > > > +                       return PTR_ERR(ihid_elan->vcc33);
> > > > > > +       }
> > > > > > +
> > > > > >         return i2c_hid_core_probe(client, &ihid_elan->ops,
> > > > > >                                   ihid_elan->chip_data->hid_descriptor_address, 0);
> > > > > >  }
> > > > > >
> > > > > >  static const struct elan_i2c_hid_chip_data elan_ekth6915_chip_data = {
> > > > > >         .post_power_delay_ms = 1,
> > > > > > -       .post_gpio_reset_delay_ms = 300,
> > > > > > +       .post_gpio_reset_on_delay_ms = 300,
> > > > > > +       .hid_descriptor_address = 0x0001,
> > > > > > +       .main_supply_name = "vcc33",
> > > > > > +};
> > > > > > +
> > > > > > +static const struct elan_i2c_hid_chip_data ilitek_ili9882t_chip_data = {
> > > > > > +       .post_power_delay_ms = 1,
> > > > > > +       .post_gpio_reset_on_delay_ms = 200,
> > > > > > +       .post_gpio_reset_off_delay_ms = 65,
> > > > > >         .hid_descriptor_address = 0x0001,
> > > > > > +       /*
> > > > > > +        * this touchscreen is tightly integrated with the panel and assumes
> > > > > > +        * that the relevant power rails (other than the IO rail) have already
> > > > > > +        * been turned on by the panel driver because we're a panel follower.
> > > > > > +        */
> > > > > > +       .main_supply_name = NULL,
> > > > > >  };
> > > > > >
> > > > > >  static const struct of_device_id elan_i2c_hid_of_match[] = {
> > > > > >         { .compatible = "elan,ekth6915", .data = &elan_ekth6915_chip_data },
> > > > > > +       { .compatible = "ilitek,ili9882t", .data = &ilitek_ili9882t_chip_data },
> > > > >
> > > > > Logically, this patch depends on the panel-follower series that's now
> > > > > landed in drm-misc-next. With your Ack, I'm willing to land these two
> > > > > patches into drm-misc-next too. Other options:
> > > >
> > > > If you are fine with the code, I think it could go with the drm tree
> > > > given that it depends on the panel-follower.
> > > >
> > > > Unless it's too late for you to take 6.6 material (sorry I was off in
> > > > August and just came back).
> > > >
> > > > Acked-By: Benjamin Tissoires <bentiss@kernel.org>
> > >
> > > Thanks for the Ack, but yeah, it's probably too late for drm-misc.
> > > Hopefully this can go through the normal tree after the next -rc1
> > > then. Thanks!
> >
> > We don't have those strict rules in hid.git. And given that I was in
> > PTO, I think it's fine if we take the patch now if it's compiling fine
> > on its own and doesn't break on existing hardware. What are the
> > consequences of using this patch without the panel-follower series?
> 
> I think it should be fine.
> 
> I actually tried running `make dt_binding_check
> DT_SCHEMA_FILES=ilitek,ili9882t.yaml` with just this bindings file and
> I actually _didn't_ get an error, so that's good. I guess it still
> verifies OK even without commit 2ca376ef18f6 ("dt-bindings: HID:
> i2c-hid: Add "panel" property to i2c-hid backed touchscreens"). I
> guess the "panel: true" is enough for it to at least not complain...
> ;-)
> 
> So I think there's no downside to landing this in the i2c-hid tree. As
> I mentioned before, this panel won't actually be functional without
> the panel follower code, but once the two meetup in linuxnext we'll
> end up with something that works. :-)
> 
> 
> > Also, does it has enough reviews from the DT folks?
> 
> The bindings have Krzysztof's review and that's the important one. I
> believe Krzysztof was unhappy that Cong Yang hasn't been including
> version history in each individual patch, but he did provide a
> reviewed by on v5 [1]

Great!

thanks for the confirmation of the tests. As you should have seen in my
reply in 0/2, the patches are now applied.

Cheers,
Benjamin

> 
> [1] https://lore.kernel.org/all/949a2d21-eb14-3ef8-a7be-9c12152cd15a@linaro.org/
