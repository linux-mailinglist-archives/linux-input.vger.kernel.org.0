Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8401B4BD1
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 12:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727057AbfIQKSu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 06:18:50 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:53699 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbfIQKSu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 06:18:50 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAAZM-0002Jy-34; Tue, 17 Sep 2019 12:18:48 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAAZL-0003Ha-Eg; Tue, 17 Sep 2019 12:18:47 +0200
Date:   Tue, 17 Sep 2019 12:18:47 +0200
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
Message-ID: <20190917101847.h22mtdtqbrlvdpxb@pengutronix.de>
References: <20190916140358.30036-1-m.felsch@pengutronix.de>
 <20190916140358.30036-3-m.felsch@pengutronix.de>
 <AM5PR1001MB0994427D3D456A68B827CFD8808C0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM5PR1001MB0994427D3D456A68B827CFD8808C0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:29:32 up 122 days, 15:47, 67 users,  load average: 0.03, 0.05,
 0.03
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Adam,

On 19-09-16 15:01, Adam Thomson wrote:
> On 16 September 2019 15:04, Marco Felsch wrote:
> 
> > The pmic state machine behaviour upon a 'onkey press' event can be
> > configured using the ONKEY_PIN bit field. Most the time this is
> > configured correct by the OTP but sometimes we need to adjust the
> > behaviour so we need to add the support here.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  drivers/input/misc/da9063_onkey.c | 10 ++++++++++
> >  drivers/mfd/da9062-core.c         |  1 +
> >  2 files changed, 11 insertions(+)
> > 
> > diff --git a/drivers/input/misc/da9063_onkey.c
> > b/drivers/input/misc/da9063_onkey.c
> > index fd355cf59397..bc982fcc87eb 100644
> > --- a/drivers/input/misc/da9063_onkey.c
> > +++ b/drivers/input/misc/da9063_onkey.c
> > @@ -40,6 +40,7 @@ struct da9063_onkey {
> >  	const struct da906x_chip_config *config;
> >  	char phys[32];
> >  	bool key_power;
> > +	u8 key_opmode;
> >  };
> > 
> >  static const struct da906x_chip_config da9063_regs = {
> > @@ -193,6 +194,7 @@ static int da9063_onkey_probe(struct platform_device
> > *pdev)
> >  {
> >  	struct da9063_onkey *onkey;
> >  	const struct of_device_id *match;
> > +	unsigned int val;
> >  	int irq;
> >  	int error;
> > 
> > @@ -220,6 +222,14 @@ static int da9063_onkey_probe(struct platform_device
> > *pdev)
> >  	onkey->key_power = !of_property_read_bool(pdev->dev.of_node,
> >  						  "dlg,disable-key-power");
> > 
> > +	if (!of_property_read_u32(pdev->dev.of_node, "dlg,key-opmode",
> > &val)) {
> > +		error = regmap_update_bits(onkey->regmap,
> > DA9062AA_CONFIG_I,
> > +					   DA9062AA_NONKEY_PIN_MASK,
> > +					   val << DA9062AA_NONKEY_PIN_SHIFT);
> > +		if (error)
> > +			return error;
> > +	}
> > +
> 
> This driver is used to cover DA9061, DA9062 and DA9063. This binding therefore
> can apply to any of those as there's no checking of which device is being used.
> For DA9063 usage, if this option is present then the probe will fail as your
> regmap range update below only takes care of DA9061/2.

That's right and I only updated the da9061/2 bindings.. 

> Ideally I think you should update the da906x_chip_config structure for this to
> support all devices as I believe the same or similar options are available for
> DA9063.

After checking the da9062/3 register.h this bitfield is the same for
da9062/3 devices. What about adding a comment here? The CONFIG_I
register is already writeable for the da9063 devices.

Regards,
  Marco

> 
> >  	onkey->input = devm_input_allocate_device(&pdev->dev);
> >  	if (!onkey->input) {
> >  		dev_err(&pdev->dev, "Failed to allocated input device.\n");
> > diff --git a/drivers/mfd/da9062-core.c b/drivers/mfd/da9062-core.c
> > index e69626867c26..aaa1f1841bc3 100644
> > --- a/drivers/mfd/da9062-core.c
> > +++ b/drivers/mfd/da9062-core.c
> > @@ -510,6 +510,7 @@ static const struct regmap_range
> > da9062_aa_writeable_ranges[] = {
> >  	regmap_reg_range(DA9062AA_VLDO1_B, DA9062AA_VLDO4_B),
> >  	regmap_reg_range(DA9062AA_BBAT_CONT, DA9062AA_BBAT_CONT),
> >  	regmap_reg_range(DA9062AA_GP_ID_0, DA9062AA_GP_ID_19),
> > +	regmap_reg_range(DA9062AA_CONFIG_I, DA9062AA_CONFIG_I),
> >  };
> > 
> >  static const struct regmap_range da9062_aa_volatile_ranges[] = {
> > --
> > 2.20.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
