Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A632C158AA
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2019 07:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726175AbfEGFAZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 May 2019 01:00:25 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:33449 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726008AbfEGFAZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 May 2019 01:00:25 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id DD9F124617;
        Tue,  7 May 2019 01:00:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 07 May 2019 01:00:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=G
        vpbZBgNMXflnMGNR5vyeIgEKAyxBkeV/ay2TmPZFP4=; b=Et3+toFVGj6ppxTA4
        mSKTIKpGtysB6HCOo/tZdU6v0mrKnoXgwYnKgm59zEb5W54bewaioCC+wi5LA5dj
        edgj3rfXUrtXILI3K64DbkOWMjREucV9lLbmwXS++RPUN01BngQXHZqhq3d1gjZq
        7m75d3LpskrwCKNl1VhLSwo5lws4vZDfpguxI/toUv4HULULkn6mv76XW+PSNRH7
        UzAXL59E7O/pP5rtLjCwKcVrNYa5TDyoMGvDZDZHY0ktM1sz8ARKTeB/wW18SFxK
        v8RCK/ko7QdSbxTl3tSzyloepxW9d2lU0hViKr3UPnn+fxXiDo4QgoOyPRRsGe2P
        sOLxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=GvpbZBgNMXflnMGNR5vyeIgEKAyxBkeV/ay2TmPZF
        P4=; b=vX/UjmruYxl0f/ZfiqJOWc5lHkUTSpyx+PY7aFgdDn8DpWa57gYLDGsU3
        vZejP2fPdINS9K352z8fxtDGXbilfPwERignb3//PReLmjdcIiE7awMk2J/1iv0T
        2FqDsl0BCTsKQHRs+f7+xNkKH+oOXAUsA+epqpdzsdnFJS1NLIRz+Rnbs+J/B+MF
        F/2HjxDXur7+JHs7CCxU6gFybch/hdgxHOrSRGVnTKpurKFoj5ZvbJH9A56Im3an
        k3e6ZEkYM8vU52QCjYBkitvfAJ4r5EXj+MMT36BMYiWoXuHjsb3FoXQ880bo2uVg
        qMADu9eipoOwAi4HW9MG6s0ePQXVA==
X-ME-Sender: <xms:5hDRXGy06cgYPrTksCd9g24UlAU_VjwCs3Ce1ZAOUTxuN4d3TcJvzg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrjeelgdeltdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggugfgjfgesthekredttderjeenucfhrhhomheprfgvthgv
    rhcujfhuthhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvg
    htqeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduudejrddvtddrieel
    rddugedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrrdhhuhhtthgvrhgvrh
    esfihhohdqthdrnhgvthenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:5hDRXMruXwbeRndInCQT8op3BYy15GQFq9DtQQkBd5ykq10iJNVgfw>
    <xmx:5hDRXOfHYOJ5koGZ0o4zLu1VwxKOo0exY3yRP4JjuPeZ_lIP9BiLCg>
    <xmx:5hDRXHrLKQ3JwWmrHeShSuDLqd9e9P5tNa7FSkY-BF9FkCTuMwm9gA>
    <xmx:5xDRXOGZ19TrgbnRhZfdudiaMNTkIL77Hn2F_PaiVb0hHfk7-AKqlA>
Received: from jelly (117-20-69-142.751445.bne.nbn.aussiebb.net [117.20.69.142])
        by mail.messagingengine.com (Postfix) with ESMTPA id E5B29103CB;
        Tue,  7 May 2019 01:00:18 -0400 (EDT)
Date:   Tue, 7 May 2019 15:00:29 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     =?utf-8?B?QsWCYcW8ZWogU3pjenlnaWXFgg==?= <spaz16@wp.pl>
Cc:     igorkuo@gmail.com, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: fix A4Tech horizontal scrolling
Message-ID: <20190507050029.GA5197@jelly>
References: <AO-hwJKNH7WoJV-X+egK5cJNNtxamh0L0e1er5dkiTt6KvrmSQ@mail.gmail.com>
 <20190503202836.12127-1-spaz16@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190503202836.12127-1-spaz16@wp.pl>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 03, 2019 at 10:28:36PM +0200, Błażej Szczygieł wrote:
> Since recent high resolution scrolling changes the A4Tech driver must
> check for the "REL_WHEEL_HI_RES" usage code.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=203369
> Fixes: 2dc702c991e3774af9d7ce410eef410ca9e2357e ("HID: input: use the
> Resolution Multiplier for high-resolution scrolling")
> 
> Signed-off-by: Błażej Szczygieł <spaz16@wp.pl>
> ---
> Changes in v2:
> - changed commit message
> 
>  drivers/hid/hid-a4tech.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hid/hid-a4tech.c b/drivers/hid/hid-a4tech.c
> index 9428ea7cdf8a..fafb9fa558e7 100644
> --- a/drivers/hid/hid-a4tech.c
> +++ b/drivers/hid/hid-a4tech.c
> @@ -38,7 +38,7 @@ static int a4_input_mapped(struct hid_device *hdev, struct hid_input *hi,
>  {
>  	struct a4tech_sc *a4 = hid_get_drvdata(hdev);
>  
> -	if (usage->type == EV_REL && usage->code == REL_WHEEL)
> +	if (usage->type == EV_REL && usage->code == REL_WHEEL_HI_RES)
>  		set_bit(REL_HWHEEL, *bit);
>  
>  	if ((a4->quirks & A4_2WHEEL_MOUSE_HACK_7) && usage->hid == 0x00090007)
> @@ -60,7 +60,7 @@ static int a4_event(struct hid_device *hdev, struct hid_field *field,
>  	input = field->hidinput->input;
>  
>  	if (a4->quirks & A4_2WHEEL_MOUSE_HACK_B8) {
> -		if (usage->type == EV_REL && usage->code == REL_WHEEL) {
> +		if (usage->type == EV_REL && usage->code == REL_WHEEL_HI_RES) {
>  			a4->delayed_value = value;
>  			return 1;
>  		}
> @@ -77,7 +77,7 @@ static int a4_event(struct hid_device *hdev, struct hid_field *field,
>  		return 1;
>  	}
>  
> -	if (usage->code == REL_WHEEL && a4->hw_wheel) {
> +	if (usage->code == REL_WHEEL_HI_RES && a4->hw_wheel) {
>  		input_event(input, usage->type, REL_HWHEEL, value);

You'll need to send both events here, so please add:
   		input_event(input, usage->type, REL_HWHEEL_HI_RES, value * 120);

assume that wheel and wheel_hi_res are two separate event streams for the
same axis, userspace may listen to either or both. if you only send the
legacy event, newer userspace won't receive any scroll events as it may only
look for the new hi-res events.

Check with evtest/evemu/libinput record after, you should see multiples of
120 on the hi-res axis for every legacy wheel event.

Cheers,
   Peter

>  		return 1;
>  	}
> -- 
> 2.21.0
> 
