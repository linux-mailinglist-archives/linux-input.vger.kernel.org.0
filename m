Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B740D7A62F5
	for <lists+linux-input@lfdr.de>; Tue, 19 Sep 2023 14:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231744AbjISMaW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Sep 2023 08:30:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231913AbjISMaW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Sep 2023 08:30:22 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C23DDF2
        for <linux-input@vger.kernel.org>; Tue, 19 Sep 2023 05:30:15 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1qiZrp-0006Vd-6f; Tue, 19 Sep 2023 14:30:13 +0200
Received: from [2a0a:edc0:2:b01:1d::c0] (helo=ptx.whiteo.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <mfe@pengutronix.de>)
        id 1qiZrn-007S2V-TK; Tue, 19 Sep 2023 14:30:11 +0200
Received: from mfe by ptx.whiteo.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1qiZrn-009cbD-Qd; Tue, 19 Sep 2023 14:30:11 +0200
Date:   Tue, 19 Sep 2023 14:30:11 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc:     bartp@baasheep.co.uk, kernel@pengutronix.de,
        bsp-development.geo@leica-geosystems.com,
        Gregory Clement <gregory.clement@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-input@vger.kernel.org, pedro.torruella@touchnetix.com,
        hannah.rossiter@touchnetix.com, mark.satterthwaite@touchnetix.com
Subject: Re: [PATCH] Input: add driver for TouchNetix aXiom touchscreen
Message-ID: <20230919123011.ywgtlmlj65xfhhkx@pengutronix.de>
References: <20230908153203.122062-1-kamel.bouhara@bootlin.com>
 <20230908153203.122062-2-kamel.bouhara@bootlin.com>
 <20230918193833.kphbb5guk74aofcf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918193833.kphbb5guk74aofcf@pengutronix.de>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Kamel,

On 23-09-18, Marco Felsch wrote:
> On 23-09-08, Kamel Bouhara wrote:
> > Add a new driver for the TouchNetix's aXiom family of
> > multi-touch controller. This driver only support i2c
> > and can be later adapted for SPI and USB support.
> > 
> > Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> > ---
> >  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
> >  MAINTAINERS                                   |   7 +
> >  drivers/input/touchscreen/Kconfig             |  11 +
> >  drivers/input/touchscreen/Makefile            |   1 +
> >  drivers/input/touchscreen/axiom_core.c        | 382 ++++++++++++++++++
> >  drivers/input/touchscreen/axiom_core.h        | 140 +++++++
> >  drivers/input/touchscreen/axiom_i2c.c         | 349 ++++++++++++++++
> >  7 files changed, 892 insertions(+)
> >  create mode 100644 drivers/input/touchscreen/axiom_core.c
> >  create mode 100644 drivers/input/touchscreen/axiom_core.h
> >  create mode 100644 drivers/input/touchscreen/axiom_i2c.c

...

> > +/* Enables the raw data for up to 4 force channels to be sent to the input subsystem */
> > +#define U46_ENABLE_RAW_FORCE_DATA
> > +
> > +/**
> > + * u31 has 2 pages for usage table entries.
> > + * (2 * AX_COMMS_PAGE_SIZE) / U31_BYTES_PER_USAGE = 85
> > + */
> > +#define U31_MAX_USAGES		(85U)
> > +#define U41_MAX_TARGETS		(10U)
> > +#define U46_AUX_CHANNELS	(4U)
> > +#define U46_AUX_MASK		(0xFFFU)
> > +#define U31_BYTES_PER_USAGE	(6U)
> > +#define USAGE_2DCTS_REPORT_ID	(0x41U)
> > +#define USAGE_2AUX_REPORT_ID	(0x46U)
> > +#define USAGE_2HB_REPORT_ID	(0x01U)
> > +#define PROX_LEVEL		(-128)
> > +#define AX_U31_PAGE0_LENGTH	(0x0C)
> > +#define AX_COMMS_WRITE		(0x00U)
> > +#define AX_COMMS_READ		(0x80U)
> > +#define AX_COMMS_BYTES_MASK	(0xFFU)
> > +
> > +#define DEVINFO_USAGE_ID	0x31
> > +#define REPORT_USAGE_ID		0x34
> > +
> > +#define REBASELINE_CMD		0x03
> > +
> > +#define COMMS_MAX_USAGE_PAGES	(3)
> > +#define AX_COMMS_PAGE_SIZE	(256)
> > +
> > +#define COMMS_OVERFLOW_MSK	(0x80)
> > +#define COMMS_REPORT_LEN_MSK	(0x7F)
> 
> The defines look not good, please use proper kernel coding style. Also
> I'm not sure if we should follow the downstream solution here. Of course
> there is this concept of usages, pages and offsets:
> 
>                                     / reg0 (0x0)
>             /  page-0 (0x0)  -------+ reg1 (0x1)
>             |                       | ...
> u(sage)31 --+  page-1 (0x1)         \ reg127 (0xff)
>             |
>             \  page-2 (0x2)
> 
> But in the end it is just a 16bit register and we can access is
> partially. We only need to know the register, the len-bytes we have to
> read/write and the reg-mask we may need to apply.
> 
> #define AXIOM_PAGE_MASK		GENMASK(15, 8)
> #define AXIOM_PAGE_OFFSET_MASK	GENMASK(7, 0)
> 
> struct axiom_reg {
> 	u16 reg;
> 	u16 len;
> 	u32 mask;
> }
> 
> #define AXIOM_REG(_page, _offset_bytes, _len_bytes, _mask) {		\
> 	.reg = FIELD_PREP(AXIOM_PAGE_MASK, _page) |	   		\
> 	       FIELD_PREP(AXIOM_PAGE_OFFSET_MASK, _offset_bytes),	\
> 	.len = _len_bytes,					   	\
> 	.mask =_ mask,					   		\
> }
> 
> enum axiom_reg_desc {
> 	AXIOM_U31_DEVICE_ID,
> 	AXIOM_U31_MODE,
> 	AXIOM_U31_RUTNIME_FW_VARIANT,
> 	AXIOM_U31_RUTNIME_FW_STATUS,
> };
> 
> static struct axiom_reg axiom_reg[] = {
> 	[AXIOM_U31_DEVICE_ID] = AXIOM_REG(0, 0, 2, GENMASK(14, 0)),
> 	[AXIOM_U31_MODE] = AXIOM_REG(0, 1, 1, BIT(7)),
> 	[AXIOM_U31_RUTNIME_FW_VARIANT] = AXIOM_REG(0, 4, 1, GENMASK(6, 0)),
> 	[AXIOM_U31_RUTNIME_FW_STATUS] = AXIOM_REG(0, 4, 1, BIT(7)),
> };
> 
> Of course this does not cover the event read case but all the other
> cases and would simplify the decoding or just use the common pattern
> like:
> 
> #define AXIOM_REG(page, offset)				\
> 	(FIELD_PREP(AXIOM_PAGE_MASK, (page)) | 		\
> 	 FIELD_PREP(AXIOM_PAGE_OFFSET_MASK, (offset)))
> 
> #define AXIOM_U31_DEVICE_ID_REG			AXIOM_REG(0, 0)
> #define   AXIOM_U31_DEVICE_ID_MASK		GEMASK(14, 0)
> 
> #define AXIOM_U31_MODE_REG			AXIOM_REG(0, 1)
> #define   AXIOM_U31_MODE_MASK			BIT(7)
> 
> #define AXIOM_U31_RUTNIME_FW_REG		AXIOM_REG(0, 4)
> #define   AXIOM_U31_RUTNIME_FW_STATUS_MASK	BIT(7)
> #define   AXIOM_U31_RUTNIME_FW_VARIANT_MASK	GENMASK(6, 0)
> 
> so in the end we can could use:
> 
> - axiom_read(priv, AXIOM_U31_DEVICE_ID) or
> - axiom_read(priv, AXIOM_U31_DEVICE_ID_REG, 2);

After getting a bit more into the details I saw that this can't be used
as I suggested since a few commands require parameters and an
i2c-stop/start cycle in between corrupt the command. So we really need
to use AXIOM_Uxx pages/registers. For this I still suggest to not bang
on buffers like:

   bootloader_fw_ver_major = data[offset]
   bootloader_fw_ver_minor = data[offset++]

Instead we should add headers to access/prepare the data more
user-friendly.

Regards,
  Marco
