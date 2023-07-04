Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 243E6746838
	for <lists+linux-input@lfdr.de>; Tue,  4 Jul 2023 06:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjGDEDg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Jul 2023 00:03:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbjGDEDZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 4 Jul 2023 00:03:25 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 557FBE6A;
        Mon,  3 Jul 2023 21:03:23 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id F1E245C0150;
        Tue,  4 Jul 2023 00:03:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 04 Jul 2023 00:03:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; t=1688443402; x=1688529802; bh=Tz
        UkfM7huciW8VhwVnvRMErywl26g+hJgmqbirycXGU=; b=ne+fpr4AVhD/+FKE63
        UrtipHBq0d1HcxMhAA6nefestnCLmrLT/x7PCiuTVykZDPXLer9jySUn+qUcnWAI
        V0dhZ3gYY5Y9TWPovI888v9+J4t1hxsSkQFHGEI3TM2ou4q0MsCCYlriJ558sCNA
        Z5bDmEHHzzJ0mJ9I/4alXJ9k1hmRBLAUO4FqAke55nR89MXAv9ggO7AGzTTbfgS+
        RcBz/0ngc5GsxrF2S8nt7d1lPKyjvmLpNFSwYz3GrZHqLczx5gBxlFyha6i3fKll
        XnMykv1GJ3arBBVukzxkPmo+RwBxLwgGeVNBSWGRZlhTNvK+4KaHc7n+2ZQZB5/f
        vNSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1688443402; x=1688529802; bh=TzUkfM7huciW8
        VhwVnvRMErywl26g+hJgmqbirycXGU=; b=L8qRvW81svHbpGZGLlN+FlbSRKlXN
        bz97WYtpRzUWjL5KjSxNyI8Swaht5bchq+n+HQn9DMwzRRg8wYL2+T510TwhTTFB
        +OTJFNj3zi20pAEYtJ40xlnhkAhHWmXKIhbHH2tQcYzK/u6KX5OdT5/HWXIlW+wD
        YDE6vFJrI/ojhMBAHHtVBoozIl1uSqCiE5NLbAopLG1kSrMLlwKG73nKpy+FAy9/
        ziqWpI7MkHYWVYsOxuaw1FGOcvtL9UfnCu5xOmkAa3zcfHcVVlzMjPRiR21BFAGB
        MR1GkKJY51bj92mrCLrQrFl0zz7fTvbg861S9jQQGX6kJXeX06pRuXWRA==
X-ME-Sender: <xms:CpqjZOcR3hdRs1X-2I13bOKfMr2AlqLUR_g-KtgPkWfqqfSa8notTg>
    <xme:CpqjZINFjcjmDbT5ri8vXgf15SveQSBGJOrXJ4JQLWabCg6xnVEVw-Kdf6UrmJvbp
    GDssU83NwJFdc8_kCQ>
X-ME-Received: <xmr:CpqjZPiivvYLAr4TmQEiCkgDi7AZsWyZUOTY0rVHUbtOoZydEEHl9GnOQ5FnaHwYcu336LWtcuDpxkYG-bp8j4jLpIs7b_S04reI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudefgdejkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
    fuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpeffhffvvefukfhfgggtuggj
    sehttdertddttddvnecuhfhrohhmpefrvghtvghrucfjuhhtthgvrhgvrhcuoehpvghtvg
    hrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvtheqnecuggftrfgrthhtvghrnhepueef
    geefvdefudeulefgjefgvdeifeekuefgjeffueehiedtiefhkefhtdefjeelnecuffhomh
    grihhnpegslhhoghhsphhothdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnh
    gvth
X-ME-Proxy: <xmx:CpqjZL-fGeecXS51zY0cs2OrGcLdbF25MWbsNr3KZqVR8Ogl19ZdxA>
    <xmx:CpqjZKtixo2m4r7_8bY2updA7Q2y8mF8he6RkB-GQQobYjzZmpO9_g>
    <xmx:CpqjZCFBqFq1iQNprivx4hNkJMynCulF-BkvmjGHr440kqa6xMsYxQ>
    <xmx:CpqjZMIgKd2C2h0BcFhSxOEvraWxjcJJHvrSVV4_4ygagUAjUK90Jg>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Jul 2023 00:03:19 -0400 (EDT)
Date:   Tue, 4 Jul 2023 14:03:13 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Marco Morandini <marco.morandini@polimi.it>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/1] HID: Add introduction about HID for non-kernel
 programmers
Message-ID: <20230704040313.GA181170@quokka>
References: <d6d16821-2592-8210-475a-5388d7a79e82@polimi.it>
 <99a679e8-6b01-6805-1e33-ce02485e0063@polimi.it>
 <20230622075905.GA35108@quokka>
 <fcb47559-dac0-963b-8798-dab0d6b0b636@polimi.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcb47559-dac0-963b-8798-dab0d6b0b636@polimi.it>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jun 22, 2023 at 10:37:29PM +0200, Marco Morandini wrote:
> 
> > 
> > shameless plug! :) I wrote this post a few years ago, feel free to
> > incorporate bits from there into here
> > https://who-t.blogspot.com/2018/12/understanding-hid-report-descriptors.html
> 
> 
> Damn! This is much better than all the tutorials 
> I found while trying to orient 
> myself, and I managed to miss it :(
> 
> Would it be ok to link to it from the doc?

missed this one sorry - yes, feel free to link to it, extract parts of
it without attribution, etc.

[...]

> > Also: you now already have 2 tools to look at hid and then you use two
> > more later (hidrrd and hid-tools). I'd say it's best to just stick to
> > one tool to reduce the mental load of having to map different tool
> > outputs to what is the same base data.
> 
> I'm not sure about this: I think that hidraw needs to be introduced somewhere,
> if for nothing because it's what gets consumed by hid-record .
> Furthermore, looking at samples/hidraw/hid-example.c one can learn something, if not a lot.
> For the time being I'm leaving the paragraph, moving most of it into a footnote;
> of course we can drop it if you have a strong opinion about this. 

I don't :) The main question is (and I can't answer this for you)
is how much of an in-depth introduction you want to provide and at what
point prospective readers will have to go to search for more
information. At some point there has to be a cut-off but you get to
decide where that one is.

> >> +in the mouse example, and outputs.
> >> +"Output" means that the information is fed
> >> +from the device to the human; for examples,
> >> +a joystick with force feedback will have
> >> +some output.
> >> +
> >> +
> >> +Report IDs and Evdev events
> >> +===========================
> >> +
> >> +A single device can logically group
> >> +data into different, independent sets.
> >> +It is *as if* the HID presents
> >> +itself as different devices, each exchanging
> >> +its own data. The HID report descriptor is unique,
> >> +but the different reports are identified by means
> >> +of different ``Report ID`` fields. Whenever a ``Report ID``
> >> +is needed it is transmitted as the first byte of any report.
> > 
> > This is a bit ambiguous since it's the collections and applications that
> > split the device into different sets, the reports are just different
> > ways of reporting data that belongs to one (or more? not 100% sure) of
> > those sets then.
> > 
> > And the example below works because you have different collections on
> > your device here but that's largely orthogonal to the use of reports.
> 
> I think this came from my misunderstanding of the role of Report IDs
> and Application Collections (not that I'm sure to have undertsood everything).
> The paragraph has been rewritte, please double check.
> I'm glossing on the fact that the same Collection can have different Report IDs
> inside (btw: is this correct? And if yes, is this something that is done, in practice?).

afaik it is permitted but I'm not sure how common it is. But it's not
hard to imagine that a device out there that sends button events through
one report and motion through another.

Cheers,
  Peter
