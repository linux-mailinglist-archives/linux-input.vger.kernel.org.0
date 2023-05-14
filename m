Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBC81701E35
	for <lists+linux-input@lfdr.de>; Sun, 14 May 2023 18:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbjENQEz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 14 May 2023 12:04:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbjENQEy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 14 May 2023 12:04:54 -0400
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C950E35AF
        for <linux-input@vger.kernel.org>; Sun, 14 May 2023 09:04:52 -0700 (PDT)
Date:   Sun, 14 May 2023 16:04:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1684080289; x=1684339489;
        bh=Z1tjiBnspi5VojzpLD7kCPxP8yXyo4tdTLXYtwlgp/w=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=WLLHpUksLAzb8bsDWYw/4daqlkXprJ/vyo9jMmZ6cNXmIJkcJLMJIHNp5qvxiX1uX
         SPJA6fd7kKNwz8ZtfIowF1ZPGmdQvS95Ff+WGjIqrUqh8j9P9L8DUvxsiGAHHDjAsL
         BJyCDlKL9Dn6+tWxR2hlnO1TIeT4oe+bOyDAgHdOoB0x9k4Vutksa4Td+fhyQ6xM5E
         jQXS/gpB2TUxJDXZA8jIROpeB4e5wiLuRb+lY+eda83O1slNn1a5NNoA06tf1nGhjd
         TiaG5Tpd98hypY3qYJh6Vku+gDTOs0DJYOLD9AFLsTP6oLDF/VbngU4dmNFWB/+9uA
         INCA5rSOfJ7yg==
To:     linux-input@vger.kernel.org
From:   Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com, lains@riseup.net
Subject: Re: [PATCH 1/2] HID: logitech-dj: Add support for new lightspeed receiver iteration
Message-ID: <6e2a3869-fb03-6cbd-76f1-a80e3de39fa8@protonmail.com>
In-Reply-To: <20230222222800.83077-1-mavchatz@protonmail.com>
References: <20230222222800.83077-1-mavchatz@protonmail.com>
Feedback-ID: 20039310:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2023-02-23 00:29, Mavroudis Chatzilazaridis wrote:
> The lightspeed receiver for the Pro X Superlight uses 13 byte mouse repor=
ts
> without a report id. The workaround for such cases has been adjusted to
> handle these larger packets.
>
> libratbag recognizes the device and input events are passing through.
>
> https://github.com/libratbag/libratbag/pull/1122
>
> Co-developed-by: Filipe La=C3=ADns <lains@riseup.net>
> Signed-off-by: Filipe La=C3=ADns <lains@riseup.net>
> Signed-off-by: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
> ---

Apologies, it's been a while and I haven't received a response.
Are there issues preventing this from being reviewed or merged that I
can help with?

