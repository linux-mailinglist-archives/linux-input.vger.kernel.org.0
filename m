Return-Path: <linux-input+bounces-12213-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7CCAAE817
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 19:46:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 866C41BC6828
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 17:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 607511A2C3A;
	Wed,  7 May 2025 17:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nfnWy3f4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBD14B1E7B;
	Wed,  7 May 2025 17:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746639960; cv=none; b=KIY6XIliVE6e5wquh1mr5zBshTa+6iDLAdoje5ofNXmhg9PMwNcKtDcKJVt90itRNe362S46IWYJvtharJ//s5H7faqU9/S4l2L55QeOODTIV7r2VL9GQXZT2rW7KsXurZ2C8AtI2hqAyMulYDAR6CYPuMYmQcww0XHlLV7beg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746639960; c=relaxed/simple;
	bh=kVhYffHHaDIT0PcSHGhEnzTIG1k1JmCFdmc4y13sKX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u3UFT+C0Rlmi1iJqCi0+tbIrZLRrZevhDC22suITbAPl94f3li9M38qnFT4VCw+MPDzq6YH1Im+WH4nuhGq4XhqkwSBnY7ei1t6TffuNKDJqBHzrWxpWrulbGEM7BI/dkOYP3POOq1HIk4K+E8fVYs2g+SdKVHMmhBHztWP23IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nfnWy3f4; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22c33e4fdb8so1703125ad.2;
        Wed, 07 May 2025 10:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746639954; x=1747244754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m9v8mZmSVOBxO7Itl7sOnh+BzdfMpIaFTqqeTSzys0Q=;
        b=nfnWy3f44k3PA47U6bP1o40dObdhMjT1wfYILd3B6rFvVYzi49D4hMXukZ9h9GQkzv
         dKq0F9WYhTAfWnBwQEdRbP1QgHOAIyqRY84w/U9+Hl1ThqP58w2en9KkX3z1zn1Oqjth
         fYei4rI2V8rWEnNjAkFjsPcrC48LAHNah/jqFu2flpsDhhkY7B3Df5LLn1g4QiEdefVF
         q6J71YGWV36K0ztSwZGe4nuXPYhLxI8zKhKBq3Mfw40pFGGUkGaSqGQ+GUo5nDyP9Egl
         GA8ecc9lh6wNj4PhoaP7L4kvIQa311gmGf1j+qRjRclfswMcfrXrZlGMF4O5M90jb5G9
         Qnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746639954; x=1747244754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9v8mZmSVOBxO7Itl7sOnh+BzdfMpIaFTqqeTSzys0Q=;
        b=mA4UiC0f6x0iKYKxil0R6KZeDXoYCzD9TPwNtY8dSuL6hjVpPgCf3Nn+6Xv2s6eHI4
         THUjclrWqFHnobcFdoDNo+tINnKxwrTpPAG5F53KbEFGU0VktFiIFxWys/jCT7ySCepk
         bbNJsKlQBN4gplGDMs6kOqoS1hVcJUQFdiwRe6CZsPc1szp5zIajFl3bApL/7mB8Up/i
         k26VQjkYVTKWfNLUoSvJKSdBr1E7+wG30Rf7Xvr6BYDPOQCE/+ONIpOjYFxzhlZnYKe6
         QPD6eWfa6LBazxS1oruw+PjT3m7Q5Q5qJ1U5IIHZZRLQGjymmDjvktfkJntyxpFftJcq
         AWBg==
X-Forwarded-Encrypted: i=1; AJvYcCUBNMmy2OVT93GHrDK31xAw/Zu4c8fDyB1Ckgj/cVyypJalCiz5bB4mSiCCk7X/V5jY0u50sukSJ9iyRLNQ@vger.kernel.org, AJvYcCXepbp2a5oRLNVtx3/Gskgh2+8m/G+OWzn8X4yLi2yYd19v4sDYmGTk5RqkHOOessP02VLHyBm0jOyUpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzESj066SXd1Izj66EZhF8bxw4KW2sLHkzyPgWhlhArupzvmBVD
	WW248bqpI2APZ6wg6GSZ3sYVXkELM6GWaSUs83kHSAwBDSjOmL37
X-Gm-Gg: ASbGncvHwty1Yno3yJYawwmFyO38LSjZc1tFqcmfW6RVOy4LLo27qCbJA7ig58z0ftj
	oESqBHTHHEbNceiMytPUX066csOQpT3ukfI/0HbghN7ktSGRYLKVfU/S1vWNvQqA3hasZ6vq4Wr
	JRzJy3fgc47ca9ITYrnNdOcds9VmmtUox8fZpMb52jCphFj3d4YO88ZmF2ANE9WRFCSZDGG2tHl
	qzIdyxXU2EfpGwJ1NnNWB0NdsFII69NB3AxmRioTuN9IxWL5qac7V4QK70DP9TxpPaslcXIMgi+
	dpfuo6702VFmINWbl2exsce75Wo94Uq6u5HcHM41
X-Google-Smtp-Source: AGHT+IEmc0SdzDbJJJXULBLyz2cXnUZbj94h68V98ZOaHqGKm+uKm3bOHVVSNCIiX8A5nzAY5tkMdQ==
X-Received: by 2002:a17:903:32c1:b0:223:fbc7:25f4 with SMTP id d9443c01a7336-22e85bdb6b3mr3713155ad.14.1746639953473;
        Wed, 07 May 2025 10:45:53 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:fe5b:f2b0:d1f:f5ac])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228ff2sm97871615ad.180.2025.05.07.10.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 10:45:51 -0700 (PDT)
Date: Wed, 7 May 2025 10:45:48 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Andrew Lunn <andrew@lunn.ch>, 
	Woojung Huh <woojung.huh@microchip.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Hutterer <peter.hutterer@who-t.net>, Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [BUG] Stuck key syndrome (was: Re: [PATCH net-next v2] net: dsa:
 microchip: Add SGMII port support to KSZ9477 switch)
Message-ID: <5pqtpt3o7swty6mxdsnitultixnemfiix3zuxsxzhjb7edaylu@4d3fe7agyeuv>
References: <20250507000911.14825-1-Tristram.Ha@microchip.com>
 <20250507094449.60885752@fedora.home>
 <aBsadO2IB_je91Jx@shell.armlinux.org.uk>
 <20250507105457.25a3b9cb@fedora.home>
 <aBsmhfI45zMltjcy@shell.armlinux.org.uk>
 <aBsu-WBlPQy5g-Jn@shell.armlinux.org.uk>
 <20250507153236.5303be86@fedora.home>
 <aBtHmNGRTVP9SttE@shell.armlinux.org.uk>
 <20250507135126.7d34d18f@fedora.home>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507135126.7d34d18f@fedora.home>

On Wed, May 07, 2025 at 01:51:26PM +0200, Maxime Chevallier wrote:
> On Wed, 7 May 2025 12:44:24 +0100
> "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:
> 
> > Hi Maxime,
> > 
> > On Wed, May 07, 2025 at 03:32:36PM +0200, Maxime Chevallier wrote:
> > > Hi Russell,
> > > 
> > > On Wed, 7 May 2025 10:59:21 +0100
> > > "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:
> > >   
> > > > On Wed, May 07, 2025 at 10:23:17AM +0100, Russell King (Oracle) wrote:  
> > > > > [Sorry for going off topic here - changed the Cc list, added Linus,
> > > > > changed the subject.]
> > > > > 
> > > > > On Wed, May 07, 2025 at 10:54:57AM +0200, Maxime Chevallier wrote:    
> > > > > > On Wed, 7 May 2025 09:31:48 +0100
> > > > > > "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:    
> > > > > > > [rest of the email got deleted because Linux / X11 / KDE got confused
> > > > > > > about the state the backspace key and decided it was going to be
> > > > > > > continuously pressed and doing nothing except shutting the laptop
> > > > > > > down would stop it.]    
> > > > > > 
> > > > > > Funny how I have the same exact issue on my laptop as well...     
> > > > > 
> > > > > I've had the "stuck key" behaviour with the HP Pavilion 15-au185sa
> > > > > laptop I had previously (normally with ctrl-F keys). However, hitting
> > > > > ctrl/shift/alt would stop it.
> > > > > 
> > > > > This is the first time I've seen the behaviour with the Carbon X1
> > > > > laptop, but this was way more severe. No key would stop it. Trying to
> > > > > move the focus using the trackpad/nipple had any effect. Meanwhile
> > > > > the email was being deleted one character at a time. So I shut the

If we indeed lost a key release event somewhere the way to "restore" it
is to hit the stuck key again. Then we should get press/release with
press most likely being ignored and release achieving the desired
result. Of course that will not help if embedded controller is confused.

> > > > > laptop lid causing it to suspend, and wondered what to do... on
> > > > > re-opening the laptop, it didn't restart and is back to normal.
> > > > > 
> > > > > This suggests that the entire input subsystem in the software stack
> > > > > collapsed just after the backspace key was pressed, and Xorg never
> > > > > saw the key-release event. So Xorg duitifully did its key-repeat
> > > > > processing, causing the email to be deleted one character at a time.
> > > > > 
> > > > > The problem is, not only did this destroy the email reply, but it
> > > > > also destroyed my train of thought for the reply as well through
> > > > > the panic of trying to stop the entire email being deleted.
> > > > > 
> > > > > I don't think this is a hardware issue - I think there's a problem
> > > > > in the input handling somewhere in the stack of kernel, Xorg,
> > > > > whatever multiple input libraries make up modern systems, and KDE.
> > > > > 
> > > > > I did check the logs. Nothing in the kernel messages that suggests
> > > > > a problem. Nothing in Xorg's logs (which are difficult to tie up
> > > > > because it doesn't use real timestamps that one can relate to real
> > > > > time.) There's no longer any ~/.xsession-errors logfile for logging
> > > > > the stuff below Xorg.
> > > > > 
> > > > > I'm running Debian Stable here - kernel 6.1.0-34-amd64, X.Org X Server
> > > > > 1.21.1.7, KDE Plasma (5.27.5, frameworks 5.103.0, QT 5.15.8).    
> > > > 
> > > > I'll also add that The Carbon X1, being a laptop, its built-in keyboard
> > > > uses the i8042:
> > > > 
> > > > [    1.698156] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0x60,0x64 irq 1,12
> > > > [    1.698543] i8042: Warning: Keylock active
> > > > [    1.700170] serio: i8042 KBD port at 0x60,0x64 irq 1
> > > > [    1.700174] serio: i8042 AUX port at 0x60,0x64 irq 12
> > > > [    1.700271] mousedev: PS/2 mouse device common for all mice
> > > > [    1.702951] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input0
> > > > 
> > > > I don't have the HP laptop with me to check what that was using.
> > > > 
> > > > The mysterious thing is "Keylock active" - clearly it isn't because I
> > > > can write this email typing on that very keyboard. However, I wonder
> > > > if it needs i8042_unlock=1 to set I8042_CTR_IGNKEYLOCK.

Just ignore this message, it is harmless and trying to flip the bit
might confuse the emulation even more. Maybe we should lower the
severity of it to debug.

That said I do not see it on my Carbon (neither v5 nor v12, can't check
v9 because it is at home)... What version of Carbon do you have? Do you
have up-to-date BIOS/EC?

> > > > 
> > > > Unfortunately, it's probably going to take a year on the Carbon X1
> > > > to work out if this makes any difference.
> > > >  
> > > > > Anyone else seeing this kind of behaviour - if so, what are you
> > > > > using?  
> > > 
> > > It just happened to me as I was typing this very email (key 'd' got
> > > stuck, nothing could un-stick it, couldn't move the mouse cursor but
> > > mouse-click events did work, had to suspend/resume the laptop to fix
> > > that)

This is weird and suggests that the breakage happens up the stack from
the kernel (or down in the firmware). Mouse clicks and mouse movement is
delivered as part of a mouse packet, so if there are button clicks there
will also be movement, they are not separate. If the cursor is not
reacting that means desktop environment is not handling input properly.

> > 
> > 'd' can be quite disastrous if you're using vi and you're in command
> > mode!
> > 
> > > Got the same "Keylock active" warning at boot :
> > > 
> > > [    0.916750] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at 0x60,0x64 irq 1,12
> > > [    0.917210] i8042: Warning: Keylock active
> > > [    0.920087] serio: i8042 KBD port at 0x60,0x64 irq 1
> > > [    0.920090] serio: i8042 AUX port at 0x60,0x64 irq 12
> > > 
> > > Nothing in the kernel logs when the key got stuck.
> > > 
> > > Laptop is a Dell XPS 15 9510, Running Fedora 41 but I saw this issue
> > > before, kernel 6.14.4-200.fc41.x86_64, Wayland-based, Gnome 47.
> > > 
> > > Hopefully this helps a bit narrowing this down, I have a fairly
> > > different userspace stack and kernel version, but we do have the same
> > > driver involved and same keylock warning...  
> > 
> > Could you try booting with i8042_unlock=1 and see whether that makes any
> > difference please?
> 
> I'll try this out indeed :)
> 
> > I've added that to my grub config in preparation for rebooting, but even
> > if I booted now, I suspect it'll be some time before I have any useful
> > result.
> > 
> > How often do you see the problem?
> 
> It's very sporadic, sometimes I'll see this behaviour multiple times a
> day, and then nothing for weeks... This laptop has been very quirky
> ever since I got it, so I categorized that as a "yet another XPS 9510
> broken behaviour", but this has been a recurrent thing for multiple
> years...
> 
> So, same as you, it'll take a long time for me to say with some amount
> of certainty that 'i8042_unlock=1' has a beneficial effect, of
> course unless I see the problem happen again in the meantime.

The kernel does drop input events if userspace is unable to read buffers
quickly enough. It notifies userspace by queuing special
EV_SYN/SYN_DROPPED event and userspace is supposed to query the full
device state upon receiving it to figure out what to do. I doubt we are
running into this with keyboards, but maybe we should add some logging
there to rule this out.

I'll add Peter and Benjamin to this thread in case they have ideas.

Thanks.

-- 
Dmitry

