Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A594206D40
	for <lists+linux-input@lfdr.de>; Wed, 24 Jun 2020 09:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389424AbgFXHGe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Jun 2020 03:06:34 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:53807 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389394AbgFXHGd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Jun 2020 03:06:33 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id D3CDD5C008E;
        Wed, 24 Jun 2020 03:06:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Wed, 24 Jun 2020 03:06:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=2jW+dYRnIp9WxJsQNgfDkVdiHDX
        69T//0T1wL6rOKdU=; b=EASg3CWL4V4LAr2TD67k0hO8Q4S978Vg5bVQ8tjS3KK
        OxX1ekxZcRR/uICZnuoV7VkvKvK1OfjItNYatdSltFozOPgoh7GoMq673SHdCBQO
        vx1+bxgxzUV+3svZg+a6qb8Stj3hFIqO8XE07mZ4aFm0rvOGi9NT+nXT+5aU5phT
        Fh4VrS0QZp+DmvtDeHWy1oMrMWGpEsWSDI+nCVkMw34Ysr5SaMBs9EXD0uXccxBB
        3PiqSpFvtJxlaSaaCqAHW7NhgEh84j/7icKEdkW4djE4cx/uWFyubIhMuxo/z0+x
        klxLGbXlCRqu9iu90pwQKzt1a/qahvDtHqm4YXJP6VQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=2jW+dY
        RnIp9WxJsQNgfDkVdiHDX69T//0T1wL6rOKdU=; b=tTr8qkUDV9dvTiN4KR9ac6
        qjYBqcVt/Unut+w4ELDbBuHO8odrvHxZ7cd+n+fC7/3kVR1HvfYp0EIir1rSSBM8
        0vUM45ms6Cy0yS0vfDbN67eFHe682KQFpm4cyYt/Jd+wLa8LVvb01XOtfvaF/Gn8
        EFxMbvTCN/tNA2uwyf2bagujS/i+lrcdteB8fYoWNt1ZymRFmP1ejGvoLnQdKELj
        59NqO1sIsjlWJ67T0dGtKXPF0b4ZOo7E1J393DKmYAoK1seZAxxuA++6Q1cLeKFG
        NP933pZFdmFK+/egtjY8o51eeSZEWIbUxoXktI+WMnoM228GMA1QxsE/BVDtDo1w
        ==
X-ME-Sender: <xms:ePvyXk1YryQIxp00LHwtzGu4Sw3matRWcSllLB5LaROUo41rnAw1dA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudekiedgudduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomheprfgvthgv
    rhcujfhuthhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvg
    htqeenucggtffrrghtthgvrhhnpeehjeetgedtledugedvkeeuleduieejvdetveegudfh
    hfeuieehkedvffehfeduhfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppe
    duudejrddvtddrieekrddufedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepphgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvght
X-ME-Proxy: <xmx:ePvyXvHi75y9_4lpf4lgoyLbdVcHX9q2JCWuS6zhGcgvS0m2IAUwzw>
    <xmx:ePvyXs5-lINA6Ov64yRbKwxpNBloIvjRp_njvF4Q-VCQ-vXCFuu5yg>
    <xmx:ePvyXt198j4yzpo4WX0ywEflptaoDoYXiRgET51FO6W5Rrja9jIhtg>
    <xmx:ePvyXsRT7uXtMJMFysUklDcMifUPqxddNZWd5_CwXIttQA-6a0cZwQ>
Received: from koala (117-20-68-132.751444.bne.nbn.aussiebb.net [117.20.68.132])
        by mail.messagingengine.com (Postfix) with ESMTPA id 77A2430675A5;
        Wed, 24 Jun 2020 03:06:30 -0400 (EDT)
Date:   Wed, 24 Jun 2020 17:06:26 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Harry Cutts <hcutts@chromium.org>
Cc:     linux-input <linux-input@vger.kernel.org>, spang@chromium.org,
        Kenneth Albanowski <kenalba@google.com>,
        Jacques Pienaar <jpienaar@google.com>,
        Nikolai Kondrashov <spbnick@gmail.com>
Subject: Re: Graphics tablets getting INPUT_PROP_DIRECT incorrectly
Message-ID: <20200624070626.GA18108@koala>
References: <CA+jURctks30toWAipy-ozvwrh1CsQzZHgAuNRPHdrDY2woufMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+jURctks30toWAipy-ozvwrh1CsQzZHgAuNRPHdrDY2woufMA@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 17, 2020 at 02:39:47PM -0700, Harry Cutts wrote:
> Hi Kernel input people,
> 
> On Chrome OS, we've observed a couple of graphics tablets getting
> INPUT_PROP_DIRECT set despite them being traditional digitizers
> without screens. The two tablets we've seen this for are the Huion
> H610PRO (VID:PID 256c:006d) and the UGTABLET 10 inch PenTablet
> (28bd:0905). Reverting "HID: input: Set INPUT_PROP_-property for
> HID_UP_DIGITIZERS" (8473a93d1ba5385f63a128a285702ccc1d3ae2cc) fixes
> the Huinon, at least. (We didn't get a chance to test it with the
> UGTABLET.) Do we know if this is a shortcoming of that patch, are
> those tablets just describing themselves incorrectly in their HID
> descriptors? (in which case I guess we'd just have to add quirks for
> them)

fwiw, both huion and ugtablet are ones i know are regularly giving me
troubles in libinput because what they say they do and what they do isn't in
sync. HUION also re-uses usbids. 006d is a relatively new one I think, we
have at least 7 different devices with 0256c:006e in libwacom and need to
match on the name there, but with the Huion HS610 even that breaks - it uses
the same vid/pid *and* name of other devices despite having different
properties [1]. HS610, HS64 and your H610PRO all seem to use 000d, so...
yay?

I've CC'd Nikolai, he has much more kernel-level experience with these
devices than I do.

Cheers,
   Peter

[1] https://github.com/linuxwacom/libwacom/pull/235

