Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C81F35EDA7
	for <lists+linux-input@lfdr.de>; Wed, 14 Apr 2021 08:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349309AbhDNGrQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Apr 2021 02:47:16 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:32783 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1348255AbhDNGrP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Apr 2021 02:47:15 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 2787B177F;
        Wed, 14 Apr 2021 02:46:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 14 Apr 2021 02:46:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=64gjXIhv/+g283uK3HI1Fy6VCqL
        /A34oMNdA2BrGOz4=; b=SMaCRGz/2atN6NqYrJ7F7wtHeKeBu0pQtw6+0+gxgrv
        jNqGUiEsy9osUhvQazpqF2fAcobI4KnuqEWNBgPfyKGpkBtICKwziz398aDmFxzm
        u7gidnodlPnFNrVdsAIAfQNWAYC00b0OCWGnJ5A02WVuJIJsCzXo1fZkWNLtUsf/
        XRapJVw1mBCRMgQLUlVCoKVb/szbct8avqt1lc+QuHRq37yyvMuu6Esw8CDovf38
        jxM7c6MZECEefHH5sfVT581pvi/7y+/vdCRcs0GrHqbIgEE6c9GFhbs91cvKQC0L
        9pFn6la4Zb2Dr/qno7G6U5A7TmnPcXVIB9BEF75vCrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=64gjXI
        hv/+g283uK3HI1Fy6VCqL/A34oMNdA2BrGOz4=; b=kmSpfRPsS/4s5V9AxcP3tq
        6O0I+QZfYcEC9/0B+V8P8lznnN82Q/flYNTwhFkfetilxr/zlAnt5Zxl1SsXNE5F
        IWNJXtZsRDPvWUS/OzYWHoGwImEX0+spE0nmyl2jUsPviNz0YG5pqaZA5P/pJonb
        1Qj7KNLrNGH8H5poklrRVzMTEZXh/mc2Hz5yipbK7ClREB8taIOsw/sif/YKUHuG
        eu6pYbXaXfY2/Zq3/sc5R9CPyxzJMXNpHlMaYPuKKcTOtcg422Lj9XRkGNCuw/2K
        gnNZuuLFXTj/XTVPPKmoXUoa29CP6zRUwT/GmM4w0PSyJjAAUE18s0DquDOVkF2Q
        ==
X-ME-Sender: <xms:3Y92YDqZ5ag3wcVlNl4UXUSj2_5xyofxtNtTPZmIsO21YUYGXNFASg>
    <xme:3Y92YLM1KKqVCsTPpRQBLIKep2l-8OK-b8lU6SUb9pdLwO8z_dxF0i29hdgdnUNkj
    a9TS6pTgiu-TxcDZlg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeltddgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomheprfgvthgv
    rhcujfhuthhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvg
    htqeenucggtffrrghtthgvrhhnpeehhfehfffgheelgeeuudelhefgvdefveekudevjeev
    jeevvefggefguddufeeuveenucfkphepuddujedrvddtrdejuddrvddvkeenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrrdhhuhht
    thgvrhgvrhesfihhohdqthdrnhgvth
X-ME-Proxy: <xmx:3Y92YGodEd2js7xKNzSWFi2rN3eVDhKabvvOtJsb8gR-OuImWAxgFQ>
    <xmx:3Y92YIeWI9JDuxMiceK_-5AbpMaM6PFdOVI26iQk5pYiwCE8_I6WwQ>
    <xmx:3Y92YETBJZs0fUENrGIiR4rSOiXiggKYWi-ftHDjMqNoBi0maf9QBg>
    <xmx:3Y92YLGTs3Sir_Qd3Y8rL6mSW8UpcqQpoKBZ4iBVcU5j-A05wvDMwg>
Received: from koala (117-20-71-228.751447.bne.nbn.aussiebb.net [117.20.71.228])
        by mail.messagingengine.com (Postfix) with ESMTPA id E271524005C;
        Wed, 14 Apr 2021 02:46:50 -0400 (EDT)
Date:   Wed, 14 Apr 2021 16:46:44 +1000
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
Message-ID: <YHaP1Fzsi5pSaEq3@koala>
References: <CAL_JsqK6Bm==DaCMD3PruZoFO9iv0Te_KBVPnb9ZU0L8yDYF5Q@mail.gmail.com>
 <20210413144446.2277817-1-giulio.benetti@benettiengineering.com>
 <20210413144446.2277817-4-giulio.benetti@benettiengineering.com>
 <YHaBJ6MX9c28MUQY@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHaBJ6MX9c28MUQY@google.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Apr 13, 2021 at 10:44:07PM -0700, Dmitry Torokhov wrote:
> Hi Giulio,
> 
> On Tue, Apr 13, 2021 at 04:44:46PM +0200, Giulio Benetti wrote:
> > +
> > +	input_mt_report_pointer_emulation(tsdata->input, true);
> 
> For touchscreens it does not make much sense to report BTN_DOUBLETAP,
> BTN_TRIPLETAP, etc, events (they are really for touchpads), so I changed
> this to
> 
> 	input_mt_report_pointer_emulation(tsdata->input, false);
> 
> to only report ABS_X, ABS_Y, and BTN_TOUCH, and applied.

Can you expand on this please, just to make sure I'm not misinterpreting
those codes? Those bits are just for how many fingers are down (but without
position), dropping those bits means you restrict the device to a pure
single-touch screen. Or am I missing something here?

then again, MT support has been in the kernel for long enough that by now
everything should understand it, so there's a certain "meh" factor.

Cheers,
   Peter
