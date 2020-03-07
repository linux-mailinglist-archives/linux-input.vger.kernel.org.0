Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCB5517C985
	for <lists+linux-input@lfdr.de>; Sat,  7 Mar 2020 01:14:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgCGAOz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Mar 2020 19:14:55 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:36401 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726245AbgCGAOz (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Mar 2020 19:14:55 -0500
Received: by mail-pj1-f67.google.com with SMTP id l41so1772660pjb.1
        for <linux-input@vger.kernel.org>; Fri, 06 Mar 2020 16:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ptJTgJMqr9Vn+Awt4L84pZJrzD4f1419fUDJVYYvR+E=;
        b=aSrHx4c7aZxBQsi4Rm6pbL6dh8qmHFyfGsWhVc4hnzVlMnHiqubHCrHx2NFRUBDk6I
         scNBMAUn5W1xPuFehks3Kqclxr4xJLgLoHD3EfYHfrCQdU7yu2ZSikPxQQxhICBik5V/
         hLdyYMdFuw/oBgdYeVs5oRcqGRA3MMsBu1ghh3St1WJu6cJJaTNGJvVcYvgIfvNanXEX
         iRbLXrflX03u9sGJnTv4C34+kb9Q789GfzGx6QoXkZHtDGseCSrVSpJ6sNnXz6IHf7CP
         e6RwbFm7B18u3iaAGr4Je7gePBpGzOuebZ6g6Uzz+Fn1uCESZgZzq5ZVuTe/oHUmlTo4
         8FSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ptJTgJMqr9Vn+Awt4L84pZJrzD4f1419fUDJVYYvR+E=;
        b=onW3nxZqFcYGf23FALrq3SRHDNk6XWEqWV3MTe87eAsQ54sASCuAkZ7EuODsc5w3ij
         +u27YmmtjMSLXsKnok568okJzvbtzukkEJKc+d05U9z1EluvVfMS6prPOk0pwbxKVpDB
         9RyjKlAjlW5BrNW0gF3eJss1UrbYQNNDetDXxd36fXLP3lEp4z3renA8W60vJsEQmvth
         ZQ1ezVSdxc6pWI6l1BbZP3QQyjoqfhVbWQrrEOsPx+jVM3jX9OoexsAndJzQBCQADcvl
         CsOrnrL48fx0LDC1dfNtpvQsmqDgBvqj6ZhI2MvJF/XeIY7u2CQBmwUd2Cfu7FI1eB08
         EoOQ==
X-Gm-Message-State: ANhLgQ12ivD3LvLtVv9WEmCM+NDEduz8unL1AMgU/dUSlxD2FyTBHLBw
        soQsWGMHv0rQ/rjHXlZwQmo=
X-Google-Smtp-Source: ADFU+vvD1dZsNX7NykCWew3QZgstytn1ELpG2/0ShPHws1Mf3DL3fhO9fx/f36P2lDABCJXewjSTMA==
X-Received: by 2002:a17:90a:dac6:: with SMTP id g6mr6323338pjx.30.1583540093899;
        Fri, 06 Mar 2020 16:14:53 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id u23sm36563145pfm.29.2020.03.06.16.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 16:14:52 -0800 (PST)
Date:   Fri, 6 Mar 2020 16:14:50 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org,
        Dmitry Mastykin <mastichi@gmail.com>
Subject: Re: [PATCH v2 02/11] Input: goodix - Make loading the config from
 disk independent from the GPIO setup
Message-ID: <20200307001450.GL217608@dtor-ws>
References: <20200305220132.228722-1-hdegoede@redhat.com>
 <20200305220132.228722-2-hdegoede@redhat.com>
 <20200306040427.GC217608@dtor-ws>
 <c332be91-4487-fd8c-9a53-abf87ec32ecc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c332be91-4487-fd8c-9a53-abf87ec32ecc@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Mar 06, 2020 at 10:01:51AM +0100, Hans de Goede wrote:
> Hi,
> 
> Thank you for the review.
> 
> On 3/6/20 5:04 AM, Dmitry Torokhov wrote:
> > On Thu, Mar 05, 2020 at 11:01:23PM +0100, Hans de Goede wrote:
> > > At least on X86 ACPI platforms it is not necessary to load the touchscreen
> > > controller config from disk, if it needs to be loaded this has already been
> > > done by the BIOS / UEFI firmware.
> > > 
> > > Even on other (e.g. devicetree) platforms the config-loading as currently
> > > done has the issue that the loaded cfg file is based on the controller
> > > model, but the actual cfg is device specific, so the cfg files are not
> > > part of linux-firmware and this can only work with a device specific OS
> > > image which includes the cfg file.
> > > 
> > > And we do not need access to the GPIOs at all to load the config, if we
> > > do not have access we can still load the config.
> > > 
> > > So all in all tying the decision to try to load the config from disk to
> > > being able to access the GPIOs is not desirable. This commit adds a new
> > > load_cfg_from_disk boolean to control the firmware loading instead.
> > > 
> > > This commits sets the new bool to true when we set irq_pin_access_method
> > > to IRQ_PIN_ACCESS_GPIO, so there are no functional changes.
> > > 
> > > BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1786317
> > > BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
> > > BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=199207
> > > Cc: Dmitry Mastykin <mastichi@gmail.com>
> > > Reviewed-by: Bastien Nocera <hadess@hadess.net>
> > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > > ---
> > >   drivers/input/touchscreen/goodix.c | 12 ++++++++----
> > >   1 file changed, 8 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> > > index 9cfbcf3cbca8..28bb4385a54d 100644
> > > --- a/drivers/input/touchscreen/goodix.c
> > > +++ b/drivers/input/touchscreen/goodix.c
> > > @@ -56,6 +56,7 @@ struct goodix_ts_data {
> > >   	u16 id;
> > >   	u16 version;
> > >   	const char *cfg_name;
> > > +	bool load_cfg_from_disk;
> > >   	struct completion firmware_loading_complete;
> > >   	unsigned long irq_flags;
> > >   	enum goodix_irq_pin_access_method irq_pin_access_method;
> > > @@ -654,8 +655,10 @@ static int goodix_get_gpio_config(struct goodix_ts_data *ts)
> > >   	ts->gpiod_rst = gpiod;
> > > -	if (ts->gpiod_int && ts->gpiod_rst)
> > > +	if (ts->gpiod_int && ts->gpiod_rst) {
> > > +		ts->load_cfg_from_disk = true;
> > >   		ts->irq_pin_access_method = IRQ_PIN_ACCESS_GPIO;
> > > +	}
> > >   	return 0;
> > >   }
> > > @@ -952,7 +955,7 @@ static int goodix_ts_probe(struct i2c_client *client,
> > >   	ts->chip = goodix_get_chip_data(ts->id);
> > > -	if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_GPIO) {
> > > +	if (ts->load_cfg_from_disk) {
> > >   		/* update device config */
> > >   		ts->cfg_name = devm_kasprintf(&client->dev, GFP_KERNEL,
> > >   					      "goodix_%d_cfg.bin", ts->id);
> > > @@ -983,7 +986,7 @@ static int goodix_ts_remove(struct i2c_client *client)
> > >   {
> > >   	struct goodix_ts_data *ts = i2c_get_clientdata(client);
> > > -	if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_GPIO)
> > > +	if (ts->load_cfg_from_disk)
> > >   		wait_for_completion(&ts->firmware_loading_complete);
> > >   	return 0;
> > > @@ -1001,7 +1004,8 @@ static int __maybe_unused goodix_suspend(struct device *dev)
> > >   		return 0;
> > >   	}
> > > -	wait_for_completion(&ts->firmware_loading_complete);
> > > +	if (ts->load_cfg_from_disk)
> > > +		wait_for_completion(&ts->firmware_loading_complete);
> > 
> > If you are detaching presence of GPIOs from firmware loading, then you
> > need to move this wait higher, so we do not complete early if GPIOs are
> > not there, but firmware is being loaded.
> 
> That is a good point, I've fixed this for v3. Do you have any other
> remarks before I send out v3?

Well, it is all kind of gross, but that's what we get when vendors all
go and do their very own thing with no concern about upgrading or
reusing the solution...

Thanks.

-- 
Dmitry
