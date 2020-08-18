Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 159BD248F2C
	for <lists+linux-input@lfdr.de>; Tue, 18 Aug 2020 21:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbgHRT6h (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Aug 2020 15:58:37 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:39829 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726701AbgHRT6g (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Aug 2020 15:58:36 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 8DC725C00D2;
        Tue, 18 Aug 2020 15:58:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Tue, 18 Aug 2020 15:58:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=srLRtf
        yPdpo9nCGPQA2M5fi/uMJSQdAUW8ZXeQiAiTA=; b=LfpzPKzlJyK2Jv6h5o3o2p
        2QUwG4OpnMFwuh+En8czd3jmyItE12dMjWRFz71gkaGA5r35Nr9tQpv7MtPVQjHl
        GgT36DNDAfI7SS+om5ccd1INylkXrl9brUlWX1ufNmQzRpax+T9ijR8Gr0jzEwVZ
        ssVUhJpJacs4gwA8z8gtzz9dYSXRub2UaBqZBjhDd+lUutEfEhAJMQki1Dpu/UtC
        eG1MjO45rjPdceYahVkcuWP+fwGowq897BsMkG3olazMSrfb3KH1Tk0Y60Iy+A0F
        MacEJmOBXqb2ItCgGqFGTt3BwUGgr0tovS2h2ofHYdAPoem8dtpVqTSwaSwG+FwA
        ==
X-ME-Sender: <xms:6zI8XzE9buMAqlgKxAY1XzGEJpSzIcDwJDEtRvtfHKD2MZovA8CUbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddtiedguddvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffuvffkjghfofggtgesthdtredtredtvdenucfhrhhomhepnfhukhgv
    ucflohhnvghsuceolhhukhgvsehljhhonhgvshdruggvvheqnecuggftrfgrthhtvghrnh
    epgfeffedufffhgfeuheegffffgeegveeifeeutefhieejffetudfgueevteehtdetnecu
    kfhppedvtdefrdduudegrddugedurdduieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:6zI8XwUwDBCqQVtUMqXMt-sFgcYc7dC6rSzUJ5h-MaaqfCDNEOIkHQ>
    <xmx:6zI8X1JIUVo77JZ34nA1t-IX8oTtuugHXa7odWGbEqzmPi-R6D0igg>
    <xmx:6zI8XxHjEIg7Woislsvl6hD2QCyoepOuVdp66xO57rEd3n2czrMPqQ>
    <xmx:6zI8X6ddjKqQROC9uR7uYUjiGsAy3E1qTDAA1u7JknskQQwbn1JKuw>
Received: from [192.168.20.16] (203-114-141-16.sta.inspire.net.nz [203.114.141.16])
        by mail.messagingengine.com (Postfix) with ESMTPA id B9B1930600A6;
        Tue, 18 Aug 2020 15:58:29 -0400 (EDT)
Date:   Wed, 19 Aug 2020 07:58:14 +1200
From:   Luke Jones <luke@ljones.dev>
Subject: Re: [PATCH V5] HID: asus: add support for ASUS N-Key keyboard
To:     Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
        rydberg@bitmath.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Message-Id: <2HZ9FQ.4JVT3NKM9S0E2@ljones.dev>
In-Reply-To: <nycvar.YFH.7.76.2008182034140.27422@cbobk.fhfr.pm>
References: <20200818075916.52267-1-luke@ljones.dev>
        <nycvar.YFH.7.76.2008182034140.27422@cbobk.fhfr.pm>
X-Mailer: geary/3.36.2
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On Tue, Aug 18, 2020 at 20:37, Jiri Kosina <jikos@kernel.org> wrote:
> On Tue, 18 Aug 2020, Luke Jones wrote:
>>  @@ -751,14 +841,14 @@ static int asus_input_mapping(struct 
>> hid_device *hdev,
>>   	     usage->hid == (HID_UP_GENDEVCTRLS | 0x0026)))
>>   		return -1;
>> 
>>  -	/* ASUS-specific keyboard hotkeys */
>>  -	if ((usage->hid & HID_USAGE_PAGE) == 0xff310000) {
>>  +	/* ASUS-specific keyboard hotkeys and led backlight */
>>  +	if ((usage->hid & HID_USAGE_PAGE) == HID_UP_ASUSVENDOR) {
>>   		switch (usage->hid & HID_USAGE) {
>>   		case 0x10: asus_map_key_clear(KEY_BRIGHTNESSDOWN);	break;
>>   		case 0x20: asus_map_key_clear(KEY_BRIGHTNESSUP);		break;
>>   		case 0x35: asus_map_key_clear(KEY_DISPLAY_OFF);		break;
>>   		case 0x6c: asus_map_key_clear(KEY_SLEEP);		break;
>>  -		case 0x7c: asus_map_key_clear(KEY_MICMUTE);		break;
>>  +		case 0x7c: asus_map_key_clear(KEY_F20);		break;
> 
> This change doesn't seem to be mentioned in the changelog; why is it 
> OK in
> general case for other devices sharing this codepath?
Do you mean the HID_UP_ASUSVENDOR? This evaluates to 0xff310000. I was 
unsure
how to address that - should I mention it in changes?

The MICMUTE issue: "change "Mic Toggle" to use a keycode that works" 
maybe I
should elaborate on this - the keycode appears to be unused or 
undetected by
KDE, Gnome, XFCE, and so the mic would never toggle. F20 gives the 
desired
effect.

Thank you for the feedback. I will submit a revised patch. Should this 
be in a
new thread as I've done so far, or as a reply here?

Kind regards,
Luke Jones.


