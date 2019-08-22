Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20A609A218
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2019 23:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732733AbfHVVT2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Aug 2019 17:19:28 -0400
Received: from mail-pg1-f169.google.com ([209.85.215.169]:33472 "EHLO
        mail-pg1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731102AbfHVVT2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Aug 2019 17:19:28 -0400
Received: by mail-pg1-f169.google.com with SMTP id n190so4425892pgn.0
        for <linux-input@vger.kernel.org>; Thu, 22 Aug 2019 14:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nh1B3yfYpBuJDJ7avAE3MgU3vgwB4YvBCrlCC0HTmIw=;
        b=aMymANtfTkciqYi7nhWeCEwJ3Hq0KztzWs3v4eut9Us8Zz322NuZdutDcLBfOcOPbG
         psOpCoIbja3GJjhyvFvz2R/aZ76VsBSWzDNxMiBayDBpRo9PmLCkatAkVd3x+VJaUDbm
         mw80rTkkcasufivVJl6QR0rODMdM2IC31NMvi7rNnGgZO2rqm6gOGkx2JSu5yNR3xnig
         uB/EhEDMUVncEME1AVNuawC2vQhSEAf1HWHROKr2b+vaKa8m1WSwzeHHNbzOp+hEnd5x
         TNY+Tv0VcjdC5GZZeWlDX1mDtHcgKI5W/2aSA8qxW3C48uA3BJ9Oh0w6OiwnsDfzrwvU
         K5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nh1B3yfYpBuJDJ7avAE3MgU3vgwB4YvBCrlCC0HTmIw=;
        b=UTs3/CdC5DmkPzUZMRkBi++dEP9N0+4GqTJU7JgVPDvKSQLabpQuuil8arIpVJ3Tt1
         GYEpXTmCmaHcX/HV59mhDCpHs+0EiJew+MC3Y3OKPLKzWAfUWba+ntfBrw5dn62hFww1
         4W06FOSZmzqXpdBsW9kN+SDVDy4Q8rc4iT8xv9ynXr2vl5AqtxCHpQXTW2lcHltac+8W
         DtClHLuz+2BeBgrRs84WFbRMa+pt6tJAVi3d1a8BKHmcMOYjjiuWJs7LSu7PgHPbNTPX
         lezSYbWqvQIyN0ehuYjKZ6I2UKzZlWuGWO+XVXCKm7ODceSMPacHDjq3mXUC10FgDw1n
         NDlQ==
X-Gm-Message-State: APjAAAWIFIrtOKK6n8A2H6ni8LMg7fW1SCunZlJRRSwe/7uEYtBucN8y
        OQ9xKQ0J12eqCnpcLhcsnHD2Pr2S
X-Google-Smtp-Source: APXvYqwRk4WbfIjfBNHzT6GA3x3vQr7zKnzJdRBO9M47Pir2DB1d8WSlyb2/frygFF7ryKbCnWW0iA==
X-Received: by 2002:a17:90a:23c5:: with SMTP id g63mr1737382pje.124.1566508766802;
        Thu, 22 Aug 2019 14:19:26 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id g2sm353164pfq.88.2019.08.22.14.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2019 14:19:26 -0700 (PDT)
Date:   Thu, 22 Aug 2019 14:19:24 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2 1/7] Input: Add event-codes for macro keys found on
 various keyboards
Message-ID: <20190822211924.GA139536@dtor-ws>
References: <20190821205937.4929-1-hdegoede@redhat.com>
 <20190821205937.4929-2-hdegoede@redhat.com>
 <20190822180604.GG76194@dtor-ws>
 <8f356b32-97e8-6603-6d46-8a643763acb5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f356b32-97e8-6603-6d46-8a643763acb5@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Aug 22, 2019 at 10:14:31PM +0200, Hans de Goede wrote:
> Hi Dmitry,
> 
> On 22-08-19 20:06, Dmitry Torokhov wrote:
> > Hi Hans,
> > 
> > On Wed, Aug 21, 2019 at 10:59:31PM +0200, Hans de Goede wrote:
> > > Various keyboards have macro keys, which are intended to have user
> > > programmable actions / key-sequences bound to them. In some cases these
> > > macro keys are actually programmable in hardware, but more often they
> > > basically are just extra keys and the playback of the key-sequence is done
> > > by software running on the host.
> > > 
> > > One example of keyboards with macro-keys are various "internet" / "office"
> > > keyboards have a set of so-called "Smart Keys", typically a set of 4 keys
> > > labeled "[A]" - "[D]".
> > > 
> > > Another example are gaming keyboards, such as the Logitech G15 Gaming
> > > keyboard, which has 18 "G"aming keys labeled "G1" to G18", 3 keys to select
> > > macro presets labeled "M1" - "M3" and a key to start recording a macro
> > > called "MR" note that even though there us a record key everything is
> > > handled in sw on the host.
> > > 
> > > Besides macro keys the G15 (and other gaming keyboards) also has a buildin
> > > LCD panel where the contents are controlled by the host. There are 5 keys
> > > directly below the LCD intended for controlling a menu shown on the LCD.
> > > 
> > > The Microsoft SideWinder X6 keyboard is another gaming keyboard example,
> > > this keyboard has 30 "S"idewinder keys and a key to cycle through
> > > macro-presets.
> > > 
> > > After discussion between various involved userspace people we've come to
> > > the conclusion that since these are all really just extra keys we should
> > > simply treat them as such and give them their own event-codes, see:
> > > https://github.com/libratbag/libratbag/issues/172
> > > 
> > > This commit adds the following new KEY_ defines for this:
> > > 
> > > KEY_LCD_MENU1 - KEY_LCD_MENU5, KEY_MACRO_RECORD, KEY_MACRO_PRESET_CYCLE,
> > > KEY_MACRO_PRESET1 - KEY_MACRO_PRESET3, KEY_MACRO1 - KEY_MACRO30.
> > > 
> > > The defines leave room for adding some more LCD-menu, preset or macro keys,
> > > the maximum values above are based on the maximum values to support all
> > > currently known internet, office and gaming keyboards.
> > 
> > I must say that I am not too hot on having these in the keys space,
> > with the exception of KEY_MACRO_RECORD_* as we were trying to allow
> > userspace consumers to know what keys are supposed to mean, instead of
> > just blanked "programmable" keys. Still, we have the BTN_TRIGGER_HAPPY.
> > 
> > I guess as long as we do not try to use the new range for keys that have
> > a defined meaning but lack their own button code it is OK.
> 
> Right, these new codes are for key which are intended to be user programmable,
> they have no icon on them / no defined meaning. They come with markings
> like G1-G18 (for the Logitech _G_aming series), but they have no meaning and
> under Windows they do not function at all without host side software turning
> them intro macro keys. Other keyboards have markings like e.g. S1 - S30 for
> the Microsoft _S_idewinder series, again the intended use for these keys is
> use as macro keys configured through host side software...
> 
> Do you want me to add a big fat comment to the next version spelling this
> out extra explicitly ?

Yes please.

Thanks.

-- 
Dmitry
