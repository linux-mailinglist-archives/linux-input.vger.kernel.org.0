Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D49617C93E
	for <lists+linux-input@lfdr.de>; Sat,  7 Mar 2020 00:59:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbgCFX64 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Mar 2020 18:58:56 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41317 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726766AbgCFX6z (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Mar 2020 18:58:55 -0500
Received: by mail-pg1-f193.google.com with SMTP id b1so1792586pgm.8
        for <linux-input@vger.kernel.org>; Fri, 06 Mar 2020 15:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=1NEx9a3BNzp48WGGqVaw1hdb2tSCyNsQbiFoYrqcUxM=;
        b=FgIleNgdlpq6uLgx8ZpLuKKMK+e8k4+DUdrIMNPkuajqs7iQnkNKbuZqetcQFgzcqo
         9s6rAAWcZ82PgIHAs4Jz584YPrHQnHP0pBvPum+Ck3XZ14YLMzU93LrCeO/P3s3R8luC
         LB+yAefmIgsftoFBS14C/0sscv1o8k9SfHbWFBwLkWnA1rkz2MQT4hhMztOZO/O4Kc3R
         T78MSHJhUw6kbBtXL8CamJ/Ti97j/s+QqAmCBmcWYxXfoGfvobSKiNJjt7IsfotwuZPm
         fUCwFLTRWi+uX4fO2rmjaaQwbK9ezY9XdDYBws7Ba2lodwEDzri4cgOL4UI88OcBHYTY
         F3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=1NEx9a3BNzp48WGGqVaw1hdb2tSCyNsQbiFoYrqcUxM=;
        b=P+IuBMHBS4OcHoakghl/OiwfvJ0dmzdrUkIKxCDvqGeOv07ZOkglhsI447eEcnrw8T
         q4S3p7M/c8lEr/3iKF26c3qyB9Dn+VtV+MZBPtGUDhGQC1EIv8qM2tyEyvgNO0cPQeRX
         RZSmO8V9l8QY3lWT93tgRfLebVz0Y3lT4POyDIaw9v4u/cw5Q1bhbswQPdtpnp1wG+VD
         GjAWpP/lC4oPTAszRNSW+LdLNpzQNf2lMZrsz1MZOgc8fuU7y9mFNv9i5V90QmMitXVg
         z83U+pFQFj6uwzQ23uEwubj590tSXgXVzXxuNbRpp1DizYzNNw1qP/GVAv0myutJyr9j
         N3eA==
X-Gm-Message-State: ANhLgQ3377y5ur0WuPkR/zhOOaGQs014gNf3k2cFD0Akvr0fG2Xnz7Ai
        vshpAju9gkLUlMJWyC7cwUw=
X-Google-Smtp-Source: ADFU+vvdG6NrPiyZSjQMzXKpJ+TqVoE4JJ92MJMKZBSQ+FYiXTEtZFizonAeQcYtVa42M3H9xRbk5g==
X-Received: by 2002:aa7:9f1c:: with SMTP id g28mr3826532pfr.140.1583539133631;
        Fri, 06 Mar 2020 15:58:53 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id l21sm10496830pjt.7.2020.03.06.15.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 15:58:53 -0800 (PST)
Date:   Fri, 6 Mar 2020 15:58:50 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org,
        Dmitry Mastykin <mastichi@gmail.com>
Subject: Re: [PATCH v2 01/11] Input: goodix - Refactor IRQ pin GPIO accesses
Message-ID: <20200306235850.GK217608@dtor-ws>
References: <20200305220132.228722-1-hdegoede@redhat.com>
 <20200306040301.GB217608@dtor-ws>
 <63a3f7ca-d2c8-2e42-4934-a7e7ca521507@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63a3f7ca-d2c8-2e42-4934-a7e7ca521507@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Mar 06, 2020 at 09:54:26AM +0100, Hans de Goede wrote:
> Hi,
> 
> On 3/6/20 5:03 AM, Dmitry Torokhov wrote:
> > Hi Hans,
> > 
> > On Thu, Mar 05, 2020 at 11:01:22PM +0100, Hans de Goede wrote:
> > > Suspending Goodix touchscreens requires changing the interrupt pin to
> > > output before sending them a power-down command. Followed by wiggling
> > > the interrupt pin to wake the device up, after which it is put back
> > > in input mode.
> > > 
> > > So far we have only effectively supported this on devices which use
> > > devicetree. On X86 ACPI platforms both looking up the pins; and using a
> > > pin as both IRQ and GPIO is a bit more complicated. E.g. on some devices
> > > we cannot directly access the IRQ pin as GPIO and we need to call ACPI
> > > methods to control it instead.
> > > 
> > > This commit adds a new irq_pin_access_method field to the goodix_chip_data
> > > struct and adds goodix_irq_direction_output and goodix_irq_direction_input
> > > helpers which together abstract the GPIO accesses to the IRQ pin.
> > > 
> > > This is a preparation patch for adding support for properly suspending the
> > > touchscreen on X86 ACPI platforms.
> > > 
> > > BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1786317
> > > BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
> > > BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=199207
> > > Cc: Dmitry Mastykin <mastichi@gmail.com>
> > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > > ---
> > > Changes in v2:
> > > - Make enum member names upper-case
> > > ---
> > >   drivers/input/touchscreen/goodix.c | 62 ++++++++++++++++++++++++------
> > >   1 file changed, 51 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> > > index 0403102e807e..9cfbcf3cbca8 100644
> > > --- a/drivers/input/touchscreen/goodix.c
> > > +++ b/drivers/input/touchscreen/goodix.c
> > > @@ -31,6 +31,11 @@
> > >   struct goodix_ts_data;
> > > +enum goodix_irq_pin_access_method {
> > > +	IRQ_PIN_ACCESS_NONE,
> > > +	IRQ_PIN_ACCESS_GPIO,
> > > +};
> > > +
> > >   struct goodix_chip_data {
> > >   	u16 config_addr;
> > >   	int config_len;
> > > @@ -53,6 +58,7 @@ struct goodix_ts_data {
> > >   	const char *cfg_name;
> > >   	struct completion firmware_loading_complete;
> > >   	unsigned long irq_flags;
> > > +	enum goodix_irq_pin_access_method irq_pin_access_method;
> > >   	unsigned int contact_size;
> > >   };
> > > @@ -502,17 +508,48 @@ static int goodix_send_cfg(struct goodix_ts_data *ts,
> > >   	return 0;
> > >   }
> > > +static int goodix_irq_direction_output(struct goodix_ts_data *ts,
> > > +				       int value)
> > > +{
> > > +	switch (ts->irq_pin_access_method) {
> > > +	case IRQ_PIN_ACCESS_NONE:
> > > +		dev_err(&ts->client->dev,
> > > +			"%s called without an irq_pin_access_method set\n",
> > > +			__func__);
> > > +		return -EINVAL;
> > > +	case IRQ_PIN_ACCESS_GPIO:
> > > +		return gpiod_direction_output(ts->gpiod_int, value);
> > > +	}
> > > +
> > > +	return -EINVAL; /* Never reached */
> > 
> > I do not like these "never reached" comments. We can either let compiler
> > issue a warning that we did not cover all switch cases, or stick
> > "default:" alongside "case IRQ_PIN_ACCESS_NONE:".
> 
> I just tried removing this line, this results in:
> 
>   CC [M]  drivers/input/touchscreen/goodix.o
> drivers/input/touchscreen/goodix.c: In function ‘goodix_irq_direction_output’:
> drivers/input/touchscreen/goodix.c:593:1: warning: control reaches end of non-void function [-Wreturn-type]
>   593 | }
>       | ^

Ah, right, we use C, not C++ ;)

> 
> And I do not want to add a default label, the switch-case is on an enum type and
> if I do that I loose the useful warnings for one of the enum values not being
> handled in the switch-case.

OK, fair enough.

Thanks.

-- 
Dmitry
