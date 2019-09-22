Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF742BA317
	for <lists+linux-input@lfdr.de>; Sun, 22 Sep 2019 18:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387720AbfIVQOl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 22 Sep 2019 12:14:41 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:46896 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387471AbfIVQOl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 22 Sep 2019 12:14:41 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 5181D8039C; Sun, 22 Sep 2019 18:14:25 +0200 (CEST)
Date:   Sun, 22 Sep 2019 18:14:33 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Anson Huang <anson.huang@nxp.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "will@kernel.org" <will@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        Andy Duan <fugang.duan@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "olof@lixom.net" <olof@lixom.net>,
        "mripard@kernel.org" <mripard@kernel.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>,
        "dinguyen@kernel.org" <dinguyen@kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "marcin.juszkiewicz@linaro.org" <marcin.juszkiewicz@linaro.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "yuehaibing@huawei.com" <yuehaibing@huawei.com>,
        "cw00.choi@samsung.com" <cw00.choi@samsung.com>,
        "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>,
        "m.felsch@pengutronix.de" <m.felsch@pengutronix.de>,
        Jacky Bai <ping.bai@nxp.com>,
        "ronald@innovation.ch" <ronald@innovation.ch>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH V4 2/5] input: keyboard: imx_sc: Add i.MX system
 controller key support
Message-ID: <20190922161432.GE1999@bug>
References: <1568602373-14164-1-git-send-email-Anson.Huang@nxp.com>
 <1568602373-14164-2-git-send-email-Anson.Huang@nxp.com>
 <20190916235330.GI237523@dtor-ws>
 <DB3PR0402MB3916859326C76BC9BC1F781CF58F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB3PR0402MB3916859326C76BC9BC1F781CF58F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi!

> > > +	ret = imx_scu_call_rpc(priv->key_ipc_handle, &msg, true);
> > > +	if (ret) {
> > > +		dev_err(&input->dev, "read imx sc key failed, ret %d\n", ret);
> > > +		return;
> > > +	}
> > > +
> > > +	state = (bool)msg.state;
> > > +
> > > +	if (!state && !priv->keystate)
> > > +		state = true;
> > 
> > This needs an explanation please.
> 
> This is to handle the quick press of button, e.g., when button is pressed and released very quickly,
> when the delay work is scheduled, the button state read from SCU FW is actually a release state (0),
> the press state is (1), so the quick press/release will be ignored.
> 
> However, after double check and test, I think this should be handled by debounce time, if the button is pressed/release
> very quickly, the event should be ignored, I will remove it and reduce the debounce time to 30mS, previous 100mS
> is too long, using 30mS as debounce time, I did NOT see similar issue no matter how quick I press/release the button.

Are you sure this is expected behaviour?

AFAIK microswitches can bounce when the button is pressed and released, but will not generate
glitches when the button was not pressed, so even short presses are real and should be
propagated...

Best regards,
										Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
