Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D064A611EBC
	for <lists+linux-input@lfdr.de>; Sat, 29 Oct 2022 02:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbiJ2Afz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Oct 2022 20:35:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiJ2Afz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Oct 2022 20:35:55 -0400
X-Greylist: delayed 458 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 28 Oct 2022 17:35:53 PDT
Received: from redpilled.dev (redpilled.dev [IPv6:2a01:4f8:1c1c:f8e2::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 779BC1DE3E9
        for <linux-input@vger.kernel.org>; Fri, 28 Oct 2022 17:35:53 -0700 (PDT)
Date:   Sat, 29 Oct 2022 03:28:10 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redpilled.dev;
        s=mail; t=1667003292;
        bh=9m/S4ceGQ2SMOJmVr39xHCgJ0RuGquylP+1ZiibE29g=;
        h=Date:From:To:CC:Subject:In-Reply-To:References;
        b=FLSk7cBOWXTBQjBX9/IheQud6ojKQfxb7kbmcLGzsnJSi8ZbjFpurlNiQc3UHBCCT
         OECXTrXywHVUREsfqeBQ1PYxZlgKvHX254CZo8uuhOvpFAvFZ9pB8JsqDo5XJQfkL4
         40kXCW0yVhH20p9qEqV8J15bDDEynZQd9FXEgU6U=
From:   Mia Kanashi <chad@redpilled.dev>
To:     =?ISO-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
        jikos@kernel.org
CC:     benjamin.tissoires@redhat.com, spbnick@gmail.com,
        pobrn@protonmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andreas Grosse <andig.mail@t-online.de>
Subject: Re: [PATCH v2] HID: uclogic: Add support for XP-PEN Deco LW
In-Reply-To: <20221028082348.22386-1-jose.exposito89@gmail.com>
References: <20221028082348.22386-1-jose.exposito89@gmail.com>
Message-ID: <ED1CBF63-A70C-44FF-9F0B-80090EB347EA@redpilled.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello!

Before device sends a battery report, you can notice garbage values in a p=
ower supply capacity=2E

You can see this by running
`watch -n0=2E1 cat /sys/class/power_supply/hid-28bd-935-battery/uevent`
and then connecting the tablet=2E

You can set it to a value here, but i think this is a problem in the globa=
l hid driver?
