Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6320A249081
	for <lists+linux-input@lfdr.de>; Wed, 19 Aug 2020 00:00:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbgHRWAB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Aug 2020 18:00:01 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:38557 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726747AbgHRWAA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Aug 2020 18:00:00 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id BD760B28;
        Tue, 18 Aug 2020 17:59:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Tue, 18 Aug 2020 17:59:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=y
        8z9GNr7VQO3QRqfT8wps+3wEn3hyMIuEcl+UY7cPjg=; b=MrkSXM4fhtYJwT/zQ
        soB7M3W3Iq0NcVzYNG9LL1xPcefpC8RhGwH15zVbehk73xPVFCM6ct3xcki+iwxA
        WXk9iuCSB/MR0DtXnZCw8e7lB9aZUfml6TZMTPmLMlQXsIWOAao7KlRTK+al05fw
        A8usf+X4KhG7jXVd5GyxVNaSQ43vJoac+nZX8viwNXXnzUI8lpTBRbWrKQ+MknA+
        9VgfkogLga0kFwcEFkkYjROkcCufv8aZ1IH6S28CT5etaq6YkXccBls4zXTSjpDy
        ZE3WXpA0ZHCeCqZdAUrD9Grg8SchbxYPE6NSZedI5WyH98QN+DnTB+jAvSvKfHLs
        RB4jw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=y8z9GNr7VQO3QRqfT8wps+3wEn3hyMIuEcl+UY7cP
        jg=; b=I7BQsp4jZhs6N0boN2GDVD00Pjm9YKEufViM8U0WuzMh/y5Oq81edMDLV
        vOAu9xuKYck62PEieLxXoUzn3jnEQ1WmKemKVWtv6F1VVXUKyS/lRBrQrY0NjLox
        W0zBml7FRxUqjKCWJqb1CSsXTCEypch+yYV3lS3d9RAsol0UZ50RB+RNoGMuYqPw
        foz/TKpA4D5Dh9qwzP7zhBBNxSuRHWQfAgu3bzzXARHOKjtdbnP6mc0v2wMbGlW4
        N8ngsLBtoEAYNzjcqbghkrquQNUbcsuhO10JWSrxVUMD5m6MldwQ/wCePMi1zjlc
        P8ix2BC1vnyV+Qe9OiQXkW+3lDeWw==
X-ME-Sender: <xms:XU88X26HxqUv-opd7LS8p7RZQhl_0fnAwS-XMqPFbPAx5y9frH7lXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddtjedgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheprfgvthgv
    rhcujfhuthhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvg
    htqeenucggtffrrghtthgvrhhnpeeljefhvdekhedvieekheefkeekhfelfeduleeiudeg
    hffgieduudevhefggefhgfenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrgh
    enucfkphepuddujedrvddtrdejuddrjeefnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepphgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrd
    hnvght
X-ME-Proxy: <xmx:XU88X_6ZknhaMz2xsoi-orNgyGMDu5xQUwHFNJOgwkyM_7uELH_lFw>
    <xmx:XU88X1cdTj6Mwx3kf28e31440_E2cQ7SKcxuhiVR7RSQ1jqIwooi8g>
    <xmx:XU88XzIUtnj6RDKVvxWrrHWrbs66mTArVBMGo8qy7EDSjw2kt-cQjw>
    <xmx:Xk88X5nOBAzYSKxq8och77GumZnXQvM-pCXWXtBBPYFOq5aOFMFeUQ>
Received: from koala (117-20-71-73.751447.bne.nbn.aussiebb.net [117.20.71.73])
        by mail.messagingengine.com (Postfix) with ESMTPA id 3AE09328005A;
        Tue, 18 Aug 2020 17:59:55 -0400 (EDT)
Date:   Wed, 19 Aug 2020 07:59:51 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Paul Menzel <pmenzel@molgen.mpg.de>
Cc:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
        linux-input@vger.kernel.org
Subject: Re: No pinch events with Dell laptops and Alps
Message-ID: <20200818215951.GA2732983@koala>
References: <8b4907c5-4af8-2a2c-bbe1-46b2be2980be@molgen.mpg.de>
 <20200716232223.GA527251@koala>
 <e2bcaf1e-2fa0-0d6e-0b51-646f1de2d206@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e2bcaf1e-2fa0-0d6e-0b51-646f1de2d206@molgen.mpg.de>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 18, 2020 at 03:13:45PM +0200, Paul Menzel wrote:
> Dear Peter,
> 
> 
> Am 17.07.20 um 01:22 schrieb Peter Hutterer:
> > On Thu, Jul 16, 2020 at 03:19:32PM +0200, Paul Menzel wrote:
> 
> > > On the Dell Latitude E7250 and Dell Precision 3340 I fail to get three
> > > finger pinch events generated needed for GNOME Shell gestures [1].
> > > 
> > > Debian Sid/unstable with Linux 5.7.6 is running on these systems.
> > > 
> > >      [    1.602394] input: AlpsPS/2 ALPS GlidePoint as
> > > /devices/platform/i8042/serio1/input/input2
> > > 
> > > I am only able to create swipe events. (Four finger swipe works to switch
> > > workspaces.)
> > > 
> > > ```
> > > $ sudo libinput debug-events
> > > […]
> > > -event1   DEVICE_ADDED     AlpsPS/2 ALPS GlidePoint          seat0 default
> > > group10 cap:pg  size 98x51mm tap(dl off) left scroll-nat scroll-2fg-edge
> > > dwt-on
> > > -event2   DEVICE_ADDED     DELL Wireless hotkeys             seat0 default
> > > group11 cap:k
> > > event1  - AlpsPS/2 ALPS GlidePoint: kernel bug: Wrong slot count (4),
> > > reducing to 2
> > > -event1   GESTURE_SWIPE_BEGIN +1.549s	3
> > >   event1   GESTURE_SWIPE_UPDATE +1.549s	3 -0.36/ 0.26 (-2.59/ 1.85
> > > unaccelerated)
> > > […]
> > > ```
> > > 
> > > Does the hardware and driver support that?
> > 
> > The device is an Alps GlidePoint which are usually INPUT_PROP_SEMI_MT. On
> > those devices, we don't support 3fg pinch gestures because we don't get
> > enough data to make the gestures reliable. There is no specific quirk for
> > your device otherwise, afaict.
> 
> Thank you for your reply, and the explanation.
> 
> Four finger gestures seem to work. At least in GNOME Shell workspaces can be
> switched with that.
> 
> > If it's not semi-mt then it's too hard to say without more data, I'll need
> > at least the output from libinput record to figure out why (that recording
> > will contain the libinput version which also matters).
> 
> Sorry for omitting that. It’s 1.16.1 now. I uploaded the logs [2].

thanks. based on the log, it's not a semi-mt touchpad and has 5 slots. So gestures
should work in theory, let's move this to a libinput bug please and continue
there: https://gitlab.freedesktop.org/libinput/libinput/issues

Cheers,
   Peter

