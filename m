Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B56A742A31
	for <lists+linux-input@lfdr.de>; Thu, 29 Jun 2023 18:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231609AbjF2QDb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Jun 2023 12:03:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231537AbjF2QDa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Jun 2023 12:03:30 -0400
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C20699E
        for <linux-input@vger.kernel.org>; Thu, 29 Jun 2023 09:03:28 -0700 (PDT)
Date:   Thu, 29 Jun 2023 16:03:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1688054606; x=1688313806;
        bh=r6KUgNK8JZYK3k/+jbR7YwlTwOAcNbBRPvw8orTIW80=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=ypRfLRYOflyXQD8k1SuThGRyscuHhVnKOe1UyrCFHelaKxRvnpbmMX5WRYVY3cCL1
         ML+RxvLZ8Yi3C1q5uWit/W2dfgcT/LlnVGc8PaAR0mJAWvbe++4xohL3iuIo9tKP29
         0crO+GrEjOBXquwQBtMM70AMqh+xO4WWM4ikMesTVqsliMytFYxRYUdeUf1RaDfhtF
         zx/5geKimvd4hXdT887nqh/VQkk2g53UWWZ+Fzs265df3fVoNaHVO5gfWUdG1ML0I5
         srENrkM0sHnTU6IeAdqDFdZ7ZB3Tpq8UXfo8ZgXxstqCQ8guj8KdiE3Z5c0w18IiJ1
         0x2zcD3N1QeUg==
To:     Bastien Nocera <hadess@hadess.net>, jikos@kernel.org
From:   Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
        lains@riseup.net
Subject: Re: [RESEND PATCH 2/2] HID: logitech-hidpp: Add support for the Pro X Superlight
Message-ID: <5bdf5680-3b02-1408-330d-ddf0c573896c@protonmail.com>
In-Reply-To: <51ab0acb9e903798dc10ef4fe11eb726df76517b.camel@hadess.net>
References: <20230625162131.17921-1-mavchatz@protonmail.com> <20230625162131.17921-2-mavchatz@protonmail.com> <51ab0acb9e903798dc10ef4fe11eb726df76517b.camel@hadess.net>
Feedback-ID: 20039310:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2023-06-28 13:50, Bastien Nocera wrote:
> On Sun, 2023-06-25 at 16:21 +0000, Mavroudis Chatzilazaridis wrote:
>> This patch adds support for the Pro X Superlight. Tested over USB.
>
> Could you please list which functionality this gains the device?
> Battery reporting? Hi-res scrolling? Something else?

Sure thing. The device gains battery reporting in both wired and
wireless mode. Also, without this it's not being recognized by something
like Piper in wireless mode, and thus can't be configured.

