Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BB09360239
	for <lists+linux-input@lfdr.de>; Thu, 15 Apr 2021 08:16:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbhDOGRD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Apr 2021 02:17:03 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:59443 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230491AbhDOGRD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Apr 2021 02:17:03 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 2DF285C010E;
        Thu, 15 Apr 2021 02:16:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 15 Apr 2021 02:16:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=xpJeKXmkNApc5i/qtQ1rQItiME+
        Z8v2/EI2GZ2dmgzI=; b=aZOQo76AVTMtgbcrHiVUCRwraZpTquqv+O25mIyDPhe
        ld7iJpzKpWwUX5KFsEaTLErO8XS/WBMStPpip1ZID3w0c5CuAqjSnsvedObaf8Lf
        gGNWmaRRlHLTXQBRyW+1tFSNSbVn63UQJf6f3Rfff6FXKpOzpvboOb2YlD9/DZN1
        5aW9IuaR80CWnffFlmw27QgAaGbnf6QCXHlU8IJ1Qu+2jUtbTcuflvGSp76YdRkb
        ENjKzM3fnskbc1xVLuQLf2KNIQkyR3s2mXZ+ZjEftyx0ybt6x93x1aJh5WoEl93F
        N5OqC1z6/ripgt3sm8rj7v0pirA20m6eIirZ6deuePg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xpJeKX
        mkNApc5i/qtQ1rQItiME+Z8v2/EI2GZ2dmgzI=; b=qQs0eRptVmhNAPh5SXRF+s
        HucmhY3lq+Bmsf0WMOltAkqwSrvX42lqqG3efLwv5Flm1C7K/O7gXPjsZgDtew+U
        ymJ1Z1lq8pLDU+t5XC6WG/KLEcctsDx8H24T2Ics92sgT11rN6FgFiDJJYujkozy
        2vgX+fFRctcUCQI0lMouJxFMIpRIk9fJHAuweesm4dBSNs5Xsfw2+26QpzUKI3WU
        F0aX14izIk/BrqsK16rxCsnypx9Jnr5ZxJPLikSsdByJybOsaddEKrgqsCtbcnF3
        6ro4SxDP+mKUqstglrFx0CvNTgkFZwE9wig9Zv6AO7oO8ZZ87tmqxdhL+4GEQGZw
        ==
X-ME-Sender: <xms:R9p3YPpjq_BgxeqhwiTJO3EJfMIZ15M_Llxaf-VLAW18jOj23QXITg>
    <xme:R9p3YJpJOrPhQU557i0nc0bAG9MlSp9IHytYZU-8RWTd5JSYT_qsUVqVGUP0I3vTU
    FrRM8lPb4j5PhfhtRM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudelvddguddtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomheprfgvthgv
    rhcujfhuthhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvg
    htqeenucggtffrrghtthgvrhhnpeehhfehfffgheelgeeuudelhefgvdefveekudevjeev
    jeevvefggefguddufeeuveenucfkphepuddujedrvddtrdejuddrvddvkeenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrrdhhuhht
    thgvrhgvrhesfihhohdqthdrnhgvth
X-ME-Proxy: <xmx:R9p3YMMKSgsLkPoTCERB9b0tIbkVO-bzTsQIcfrKaWsaN-7y5uF1Uw>
    <xmx:R9p3YC4z2Z7_Th2H6nw4l8AC612AMgYFxkZ98LNzYApoc4fk57UhIg>
    <xmx:R9p3YO7iIRW5_1w4jUsPVVKC-CRfRLrLGqLxPeaaMbyNbrGc-e1njA>
    <xmx:SNp3YASdzxwCsSt2t6ecwuozouTHB3jaajjJYsZdgVIWiiK5ZnwVGg>
Received: from jelly (117-20-71-228.751447.bne.nbn.aussiebb.net [117.20.71.228])
        by mail.messagingengine.com (Postfix) with ESMTPA id BDD5F108005F;
        Thu, 15 Apr 2021 02:16:36 -0400 (EDT)
Date:   Thu, 15 Apr 2021 16:16:31 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Giulio Benetti <giulio.benetti@benettiengineering.com>,
        Rob Herring <robh@kernel.org>,
        Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/3] Input: add driver for the Hycon HY46XX touchpanel
 series
Message-ID: <YHfaP4lc1ZDWeBqb@jelly>
References: <CAL_JsqK6Bm==DaCMD3PruZoFO9iv0Te_KBVPnb9ZU0L8yDYF5Q@mail.gmail.com>
 <20210413144446.2277817-1-giulio.benetti@benettiengineering.com>
 <20210413144446.2277817-4-giulio.benetti@benettiengineering.com>
 <YHaBJ6MX9c28MUQY@google.com>
 <YHaP1Fzsi5pSaEq3@koala>
 <080a71d9-d629-5589-c943-4e65a7f414d8@benettiengineering.com>
 <YHcltT7HkJoXrX0f@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHcltT7HkJoXrX0f@google.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Apr 14, 2021 at 10:26:13AM -0700, Dmitry Torokhov wrote:
> Hi Giulio, Peter,
> 
> On Wed, Apr 14, 2021 at 01:22:55PM +0200, Giulio Benetti wrote:
> > Hi Peter, Dmitry,
> > 
> > On 4/14/21 8:46 AM, Peter Hutterer wrote:
> > > On Tue, Apr 13, 2021 at 10:44:07PM -0700, Dmitry Torokhov wrote:
> > > > Hi Giulio,
> > > > 
> > > > On Tue, Apr 13, 2021 at 04:44:46PM +0200, Giulio Benetti wrote:
> > > > > +
> > > > > +	input_mt_report_pointer_emulation(tsdata->input, true);
> > > > 
> > > > For touchscreens it does not make much sense to report BTN_DOUBLETAP,
> > > > BTN_TRIPLETAP, etc, events (they are really for touchpads), so I changed
> > > > this to
> > > > 
> > > > 	input_mt_report_pointer_emulation(tsdata->input, false);
> > > > 
> > > > to only report ABS_X, ABS_Y, and BTN_TOUCH, and applied.
> > > 
> > > Can you expand on this please, just to make sure I'm not misinterpreting
> > > those codes? Those bits are just for how many fingers are down (but without
> > > position), dropping those bits means you restrict the device to a pure
> > > single-touch screen. Or am I missing something here?
> 
> They are indeed represent number of fingers on the surface. I think I
> over-simplified this a bit by saying these events are only for
> touchpads, as there is allowance for BTN_TOOL_*TAP in
> Documentation/input/multi-touch-protocol.rst for MT devices that may
> report more contacts than what they can distinctly track, and it is
> not restricted to touchpads (but I believe in reality only used by a
> couple of "semi-MT" touchpad drivers).

fwiw, almost all touchpads on ps2 use that functionality - they can track 2
touchpoints but *detect* up to 5. There's significant insanity in libinput
to deal with that because it is so common :)

semi-mt is orthogonal to that, it's the an inability to track two
touchpoints correctly (only get top-left and bottom-right, but it's
guesswork which finger is in which corner).

> What I meant to say that for ST fallback of MT-capable devices we
> typically provide BTN_TOOL_*TAP for devices declared as INPUT_MT_POINTER
> (which is touchpads) and for INPUT_MT_DIRECT and others we only provide
> ABS_X, ABS_Y, ABS_PRESSURE and BTN_TOUCH (see input_mt_sync_frame()),
> and I think this driver should follow the suit.

ah, right. that makes sense, thanks for the clarification.

Cheers,
   Peter
