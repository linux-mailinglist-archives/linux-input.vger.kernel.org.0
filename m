Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4625B4C57
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 12:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbfIQK4H (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 06:56:07 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:51957 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726519AbfIQK4G (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 06:56:06 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAB9P-0006Ak-Nu; Tue, 17 Sep 2019 12:56:03 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAB9P-0004Ih-7G; Tue, 17 Sep 2019 12:56:03 +0200
Date:   Tue, 17 Sep 2019 12:56:03 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc:     Support Opensource <Support.Opensource@diasemi.com>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 2/4] input: misc: da9063_onkey: add mode change support
Message-ID: <20190917105603.6mhiyqnmeiz43dxb@pengutronix.de>
References: <20190916140358.30036-1-m.felsch@pengutronix.de>
 <20190916140358.30036-3-m.felsch@pengutronix.de>
 <AM5PR1001MB0994427D3D456A68B827CFD8808C0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20190917101847.h22mtdtqbrlvdpxb@pengutronix.de>
 <AM5PR1001MB0994F5DB42CEADD614FA680F808F0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <AM5PR1001MB099450E2B3AF6D7266FB2344808F0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM5PR1001MB099450E2B3AF6D7266FB2344808F0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:51:53 up 122 days, 17:10, 67 users,  load average: 0.02, 0.02,
 0.00
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 19-09-17 10:49, Adam Thomson wrote:
> On 17 September 2019 11:45, Adam Thomson wrote:
> 
> > > Hi Adam,
> > >
> > > On 19-09-16 15:01, Adam Thomson wrote:
> > > > On 16 September 2019 15:04, Marco Felsch wrote:
> > > >
> > > > > The pmic state machine behaviour upon a 'onkey press' event can be
> > > > > configured using the ONKEY_PIN bit field. Most the time this is
> > > > > configured correct by the OTP but sometimes we need to adjust the
> > > > > behaviour so we need to add the support here.
> > > > >
> > > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > > ---
> > > > >  drivers/input/misc/da9063_onkey.c | 10 ++++++++++
> > > > >  drivers/mfd/da9062-core.c         |  1 +
> > > > >  2 files changed, 11 insertions(+)
> > > > >
> > > > > diff --git a/drivers/input/misc/da9063_onkey.c
> > > > > b/drivers/input/misc/da9063_onkey.c
> > > > > index fd355cf59397..bc982fcc87eb 100644
> > > > > --- a/drivers/input/misc/da9063_onkey.c
> > > > > +++ b/drivers/input/misc/da9063_onkey.c
> > > > > @@ -40,6 +40,7 @@ struct da9063_onkey {
> > > > >  	const struct da906x_chip_config *config;
> > > > >  	char phys[32];
> > > > >  	bool key_power;
> > > > > +	u8 key_opmode;
> > > > >  };
> > > > >
> > > > >  static const struct da906x_chip_config da9063_regs = {
> > > > > @@ -193,6 +194,7 @@ static int da9063_onkey_probe(struct
> > platform_device
> > > > > *pdev)
> > > > >  {
> > > > >  	struct da9063_onkey *onkey;
> > > > >  	const struct of_device_id *match;
> > > > > +	unsigned int val;
> > > > >  	int irq;
> > > > >  	int error;
> > > > >
> > > > > @@ -220,6 +222,14 @@ static int da9063_onkey_probe(struct
> > > platform_device
> > > > > *pdev)
> > > > >  	onkey->key_power = !of_property_read_bool(pdev->dev.of_node,
> > > > >  						  "dlg,disable-key-power");
> > > > >
> > > > > +	if (!of_property_read_u32(pdev->dev.of_node, "dlg,key-opmode",
> > > > > &val)) {
> > > > > +		error = regmap_update_bits(onkey->regmap,
> > > > > DA9062AA_CONFIG_I,
> > > > > +					   DA9062AA_NONKEY_PIN_MASK,
> > > > > +					   val << DA9062AA_NONKEY_PIN_SHIFT);
> > > > > +		if (error)
> > > > > +			return error;
> > > > > +	}
> > > > > +
> > > >
> > > > This driver is used to cover DA9061, DA9062 and DA9063. This binding
> > therefore
> > > > can apply to any of those as there's no checking of which device is being used.
> > > > For DA9063 usage, if this option is present then the probe will fail as your
> > > > regmap range update below only takes care of DA9061/2.
> > >
> > > That's right and I only updated the da9061/2 bindings..
> > 
> > D'oh! That's what comes from taking a holiday the week before. :|
> 
> Actually I was right the first time. There's one binding covering this driver
> for the 3 devices so my original point was valid although if that register is
> in the valid regmap_range for DA9063 then it would succeed.

You're right, there is a bit of mixing the naming.. The driver is called
da9063 and the binding is called da9062-onkey.txt.. Anyway, as you said
the regmap_range will be valid for both cases :)

> > 
> > >
> > > > Ideally I think you should update the da906x_chip_config structure for this to
> > > > support all devices as I believe the same or similar options are available for
> > > > DA9063.
> > >
> > > After checking the da9062/3 register.h this bitfield is the same for
> > > da9062/3 devices. What about adding a comment here? The CONFIG_I
> > > register is already writeable for the da9063 devices.
> > 
> > Given the current implementation of this driver only uses tables to access the
> > correct registers and masks for each device, it would be neater to follow this
> > approach, although I am aware the register addresses and bit fields are the same.

That's right because they are needed on other places during the value
evaluation. This register is only set once during probe and shouldn't be
changed afterwards.

Regards,
  Marco

> > 
> > > Regards,
> > >   Marco
> > >
> > > >
> > > > >  	onkey->input = devm_input_allocate_device(&pdev->dev);
> > > > >  	if (!onkey->input) {
> > > > >  		dev_err(&pdev->dev, "Failed to allocated input device.\n");
> > > > > diff --git a/drivers/mfd/da9062-core.c b/drivers/mfd/da9062-core.c
> > > > > index e69626867c26..aaa1f1841bc3 100644
> > > > > --- a/drivers/mfd/da9062-core.c
> > > > > +++ b/drivers/mfd/da9062-core.c
> > > > > @@ -510,6 +510,7 @@ static const struct regmap_range
> > > > > da9062_aa_writeable_ranges[] = {
> > > > >  	regmap_reg_range(DA9062AA_VLDO1_B, DA9062AA_VLDO4_B),
> > > > >  	regmap_reg_range(DA9062AA_BBAT_CONT, DA9062AA_BBAT_CONT),
> > > > >  	regmap_reg_range(DA9062AA_GP_ID_0, DA9062AA_GP_ID_19),
> > > > > +	regmap_reg_range(DA9062AA_CONFIG_I, DA9062AA_CONFIG_I),
> > > > >  };
> > > > >
> > > > >  static const struct regmap_range da9062_aa_volatile_ranges[] = {
> > > > > --
> > > > > 2.20.1
> > > >
> > > >
> > >
> > > --
> > > Pengutronix e.K.                           |                             |
> > > Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> > > Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> > > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
