Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C77F104104
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2019 17:41:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732833AbfKTQll (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Nov 2019 11:41:41 -0500
Received: from protonic.xs4all.nl ([83.163.252.89]:34198 "EHLO protonic.nl"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729448AbfKTQll (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Nov 2019 11:41:41 -0500
X-Greylist: delayed 538 seconds by postgrey-1.27 at vger.kernel.org; Wed, 20 Nov 2019 11:41:40 EST
Received: from webmail.promanet.nl (edge2.prtnl [192.168.1.170])
        by sparta (Postfix) with ESMTP id B38DC44A0065;
        Wed, 20 Nov 2019 17:34:53 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 20 Nov 2019 17:32:38 +0100
From:   robin <robin@protonic.nl>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Robin Gong <yibin.gong@nxp.com>,
        "linux-input @ vger . kernel . org" <linux-input@vger.kernel.org>,
        "linux-kernel @ vger . kernel . org" <linux-kernel@vger.kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        "linux-arm-kernel @ lists . infradead . org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3] input: keyboard: snvs_pwrkey: Send key events for
 i.MX6 S, DL and Q
In-Reply-To: <20191120092749.7rru5fj7eybs4tl6@pengutronix.de>
References: <20190904062329.97520-1-robin@protonic.nl>
 <20190912201300.GA636@penguin>
 <803592d161b9ca75d6ac1c2c54e891a1@protonic.nl>
 <VE1PR04MB663896B94C68B5EF9AE0BE36898C0@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <20190916233701.GH237523@dtor-ws>
 <20191120092749.7rru5fj7eybs4tl6@pengutronix.de>
Message-ID: <fb98fa1fde9a367d7ab33d04a5804684@protonic.nl>
X-Sender: robin@protonic.nl
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2019-11-20 10:27, Marco Felsch wrote:
> Hi Robin,
> 
> On 19-09-16 16:37, Dmitry Torokhov wrote:
>> On Mon, Sep 16, 2019 at 07:45:37AM +0000, Robin Gong wrote:
>> > On 2019/9/13 15:31 robin <robin@protonic.nl> wrote:>
>> > > Hi Dmitry,
>> > >
>> > > On 2019-09-12 22:13, Dmitry Torokhov wrote:
>> > > > Hi Robin,
>> > > >
>> > > > On Wed, Sep 04, 2019 at 06:23:29AM +0000, Robin van der Gracht wrote:
>> > > >> The first generation i.MX6 processors does not send an interrupt when
>> > > >> the power key is pressed. It sends a power down request interrupt if
>> > > >> the key is released before a hard shutdown (5 second press). This
>> > > >> should allow software to bring down the SoC safely.
>> > > >>
>> > > >> For this driver to work as a regular power key with the older SoCs,
>> > > >> we need to send a keypress AND release when we get the power down
>> > > >> request irq.
>> > > >>
>> > > >> Signed-off-by: Robin van der Gracht <robin@protonic.nl>
>> > > >> ---
>> > > >> @@ -67,13 +83,17 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int
>> > > >> irq, void *dev_id)  {
>> > > >>  	struct platform_device *pdev = dev_id;
>> > > >>  	struct pwrkey_drv_data *pdata = platform_get_drvdata(pdev);
>> > > >> +	unsigned long expire = jiffies;
>> > > >>  	u32 lp_status;
>> > > >>
>> > > >>  	pm_wakeup_event(pdata->input->dev.parent, 0);
>> > > >>
>> > > >>  	regmap_read(pdata->snvs, SNVS_LPSR_REG, &lp_status);
>> > > >> -	if (lp_status & SNVS_LPSR_SPO)
>> > > >> -		mod_timer(&pdata->check_timer, jiffies +
>> > > >> msecs_to_jiffies(DEBOUNCE_TIME));
>> > > >> +	if (lp_status & SNVS_LPSR_SPO) {
>> > > >> +		if (pdata->minor_rev > 0)
>> > > >> +			expire = jiffies + msecs_to_jiffies(DEBOUNCE_TIME);
>> > > >> +		mod_timer(&pdata->check_timer, expire);
>> > > >
>> > > > Why do we even need to fire the timer in case of the first generation
>> > > > hardware? Just send press and release events directly from the ISR.
>> > That timer looks like a software debounce to prevent unexpected and
>> > meaningless interrupt/event caused by quick press/release.
>> 
>> Right, but in case of the first generation hardware we schedule the
>> timer immediately (expire == 0) and do not check state of the hardware
>> in the timer handler, but rather simply emit down/up events, so we do
>> not really get any benefit from the timer (again, I am talking about
>> first generation hardware only).
> 
> Did you prepared a v4? Just ask to avoid a duplicated work :)

No I haven't. Not sure what the public wants. Use timer, don't use 
timer..

v3 has had long term testing though ;)

Regards,
Robin van der Gracht
