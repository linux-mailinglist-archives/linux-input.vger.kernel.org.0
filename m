Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAE1229202E
	for <lists+linux-input@lfdr.de>; Sun, 18 Oct 2020 23:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726458AbgJRVhE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 18 Oct 2020 17:37:04 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:60153 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726249AbgJRVhE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 18 Oct 2020 17:37:04 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 796F1BEF;
        Sun, 18 Oct 2020 17:37:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sun, 18 Oct 2020 17:37:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=8KdjEi
        GkeOwKZg8D+T6BkFsyKosHdYRHkoW9z2WaA4w=; b=BDcUoifn0WnPx3ybVwi+GW
        2z0JrTv6x2XYTUqGiA5AP/xFfLXmWNHYeIK+AEYd69gYRtLlXJOHmZQbEM4VRV4W
        81Xz9K5ZEx08OmxlVG9yI1vsV3xhk1gwrVfTF96x0yJB0vFDrFkJ8pQp8JsdjxK3
        ugQDMln5U8njj9YrDKtFurTVg1dxMO9/DUoIO+deI/RopzRkeyhhcAJUSKPNS3fL
        P2fV2c0Uh41k8wwg2Rt0MuhehlFqHvWOsMqPIsEpItdJdMUa8l1gC8PoWYvRIAEd
        sxcgvjZbeXus5qMd8SS14ySacT2FBHEQWQe+MOCEQQJFtflbj6B1azQZ8s57sjVA
        ==
X-ME-Sender: <xms:fbWMX6I3FyG6HuIjsf5x1GGbm_GP0EsW4YWO_ce-XXbGCmJPuvqLJQ>
    <xme:fbWMXyJYLADHv3HMr1GZPqSVi848gfEYee8d5UoqOOZv4GjQhWdxcnyfK4SYAw90a
    03R3SNSN1RUJXM8R1k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrjedtgddtudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffuvffkjghfofggtgesthdtredtredtvdenucfhrhhomhepnfhukhgvucfl
    ohhnvghsuceolhhukhgvsehljhhonhgvshdruggvvheqnecuggftrfgrthhtvghrnhepgf
    effedufffhgfeuheegffffgeegveeifeeutefhieejffetudfgueevteehtdetnecukfhp
    pedvtdefrdduudegrddugedurdduieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:fbWMX6tqyJwk_MFKbVV6eG41ji2ipZUMZkpazWAgJN4ePwxQIFxG6Q>
    <xmx:fbWMX_Z4srUtEd_x3YvFjPi0j5afOYkkPBBXI8XsY6fpchBzzbnLDQ>
    <xmx:fbWMXxZJtshmwHss3PKAcUNEjHE8Z3WJZrwNGXfOU5c6WeiNUvGXHA>
    <xmx:f7WMXwkj3Q0qpnQMmqPImiJHggOnYka6kTHVtcUcPSxEKivdjCr_oA>
Received: from [192.168.20.20] (203-114-141-16.sta.inspire.net.nz [203.114.141.16])
        by mail.messagingengine.com (Postfix) with ESMTPA id EFA82328005A;
        Sun, 18 Oct 2020 17:36:57 -0400 (EDT)
Date:   Mon, 19 Oct 2020 10:36:44 +1300
From:   Luke Jones <luke@ljones.dev>
Subject: Re: [PATCH V8] HID: ASUS: Add support for ASUS N-Key keyboard
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Message-Id: <8P2FIQ.M2MLXE7M40153@ljones.dev>
In-Reply-To: <CAHp75VfOV2DvngsO87PLXwNKQtR-RaC4XzbBk_7wDVSEaBMrzw@mail.gmail.com>
References: <20201013073508.10476-1-luke@ljones.dev>
        <CAHp75VfOV2DvngsO87PLXwNKQtR-RaC4XzbBk_7wDVSEaBMrzw@mail.gmail.com>
X-Mailer: geary/3.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



>>  +               */
>>  +               if (report->id == FEATURE_KBD_LED_REPORT_ID1 ||
>>  +                               report->id == 
>> FEATURE_KBD_LED_REPORT_ID2) {
> 
>>  +                       return -1;
> 
> is -1 a good return code? (this Q for all cases)
> 
>>  +               /* Additional report filtering */
>>  +               } else if (report->id == FEATURE_KBD_REPORT_ID) {
>>  +                       /* Fn+F5 "fan" symbol, trigger WMI event to 
>> toggle next mode */
>>  +                       if (data[1] == 0xae) {
>>  +                               ret = asus_wmi_send_event(drvdata, 
>> 0xae);
>>  +                               if (ret < 0) {
>>  +                                       hid_warn(hdev, "Asus failed 
>> to trigger fan control event");
>>  +                               }
> 
>>  +                               return -1;
>> 

In the case of this block I really don't have any idea how
to handle it. I want to stop these particular keycodes from
being evaluated elsewhere. Returning -1 seemed to be the only
way to do this, unless my understanding is very incorrect.

Any help or guidance on how to handle this is definitely
appreciated.

Cheers,
Luke.



