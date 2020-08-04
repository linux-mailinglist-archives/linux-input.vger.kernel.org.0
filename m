Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D10723B8CC
	for <lists+linux-input@lfdr.de>; Tue,  4 Aug 2020 12:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbgHDKcd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Aug 2020 06:32:33 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:47601 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726056AbgHDKcd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 4 Aug 2020 06:32:33 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 6C06C5C00D2;
        Tue,  4 Aug 2020 06:32:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Tue, 04 Aug 2020 06:32:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=EbzkqCVjOA8rxSTu2HLqyqKFQA5VUKcqAUWgNGC6C
        TE=; b=njTW3eBQb6ZxMXJJsj9Q0FzVRxmjouZKFfZF/Y6sEx/v9iM+NoAPFDPY6
        WgmE7lmmDkVMNYZkiizmuJq+t9Vk5U5DoLRO2oXG+MuUN0Tar2DJizXckmEVOphE
        SyRMt67QQ3yqCqZWSH2EuI3gFHcIbeg0VkjNR1MENl8beDgH7bBXACRJSgWlLE5L
        2L+eprL7xJJxOyCEw+XTZ80Cgt+5NKN57qUO5PRlpWk1wWvdE1IATrHBGi+l2hb6
        hjkrIGLHRjDLvVvnjaLY8bnVjqRB2Hc5DeNb4t9vrLFG0Sjgc70cO/PCtgQosI5h
        p8cLCmzLDj0E6StUGj/AQXumE0P6g==
X-ME-Sender: <xms:QDkpX1yJ2g8vtDpHWtjD75wEJKbKxp3EHLTUjCT-S4PIRfIOElYqjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrjeeigdeftdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefnuhhkvgcu
    lfhonhgvshcuoehluhhkvgeslhhjohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpe
    dvtddvveeiuefgfeeihfdtueelkeejveehjeetgeelgefgteejgfeikedufeelveenucfk
    phepvddtfedruddugedrudeguddrudeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:QDkpX1RAO8hmoRU31Pcc4VDMk8ffR_fcuJY_VfSlOWvQvhPE11r5Og>
    <xmx:QDkpX_Uz1pnXzjmiCecBzc3WxYQlmx48VAyQzSgHEDfdTy3nJnKPjw>
    <xmx:QDkpX3ipoZNAuiPWEH2gV8uwpFVxEiRvsMzFgpkEn1yiIJAeV-vnbA>
    <xmx:QDkpX6-pf4Tm0LdxzWCVl84j2cMoYOomak_xM8CEzliQN7r2-EQC8g>
Received: from [192.168.20.21] (203-114-141-16.sta.inspire.net.nz [203.114.141.16])
        by mail.messagingengine.com (Postfix) with ESMTPA id 95F7E3280063;
        Tue,  4 Aug 2020 06:32:30 -0400 (EDT)
Message-ID: <ac137e587f9c7b5e95488313234586088a3ea104.camel@ljones.dev>
Subject: Re: [PATCH V3]: HID: asus: add support for ASUS N-Key keyboard
From:   Luke Jones <luke@ljones.dev>
To:     Silvan Jegen <s.jegen@gmail.com>
Cc:     linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Date:   Tue, 04 Aug 2020 22:32:23 +1200
In-Reply-To: <21DR28I61TGRS.30UBU8HRX5ZB4@homearch.localdomain>
References: <K6JIEQ.8WHC60A0TYJ6@ljones.dev>
         <21DR28I61TGRS.30UBU8HRX5ZB4@homearch.localdomain>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4 (by Flathub.org) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 2020-08-04 at 10:17 +0200, Silvan Jegen wrote:
> Hi
> 
> Luke Jones <luke@ljones.dev> wrote:
> > [snip...] 
> > 
> > +/*
> > + * This enables triggering events in asus-wmi
> > + */
> > +static int asus_wmi_send_event(struct asus_drvdata *drvdat, u8
> > code)
> > +{
> > + int err;
> > + u32 retval;
> > +
> > + err = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DEVS,
> > + ASUS_WMI_METHODID_NOTIF, code, &retval);
> > + if (err) {
> > + pr_warn("Failed to notify asus-wmi: %d\n", err);
> > + return err;
> > + }
> 
> It looks like your MUA removed all indentation tabs from your patch.
> IIRC,
> the gmail web interface has been accused of this before...
> 
> Most likely this will have to be fixed before someone approves of
> this patch.
> 
> 
> Cheers,
> 
> Silvan
> 
> 
> > [...]

Thank you for the heads up. Turns out Geary, although a nice email
client in general, is not suitable for this type of task.

Cheers,
Luke

