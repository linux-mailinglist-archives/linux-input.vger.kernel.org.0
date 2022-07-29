Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE27584FD1
	for <lists+linux-input@lfdr.de>; Fri, 29 Jul 2022 14:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235852AbiG2MA2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 29 Jul 2022 08:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235606AbiG2MA2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 29 Jul 2022 08:00:28 -0400
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62AB11F2ED
        for <linux-input@vger.kernel.org>; Fri, 29 Jul 2022 05:00:26 -0700 (PDT)
Date:   Fri, 29 Jul 2022 12:00:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noorman.info;
        s=protonmail3; t=1659096023; x=1659355223;
        bh=zSrpL7yk5DqsqfDDujslv+koxU365mSrM2OqCZkfY6c=;
        h=Date:To:From:Reply-To:Subject:Message-ID:Feedback-ID:From:To:Cc:
         Date:Subject:Reply-To:Feedback-ID:Message-ID;
        b=d9m+Hw5Mj7jpiRYDKepy+LurR9hfKIG1MBcDJLzfTAPpMhxAgn1nBILa7WXF6noEo
         ILPkdyWvy0fwiVfl3uRB1i7i9jFr3rYfd2McQCayBiXGLQRkuOUqyzIx3ZcDLuAyiw
         L+tj6djIBiegroFnaQr6fUgrzTpQQc/2pFpdSktMK+a94nJowXawFaHLwB8yn1bgef
         z7kmMq2dnO9ANYIFIFYeRxIhoqHx4EVxrCH45NDgi6X6JOkf+tjNb4bzi34ai7xHje
         AwnO1QCUJLcM82awAf9Bh6IXaHoPb623SVfkLheAA+g/ybbwIEsyMhz4ZcINgxxqS/
         7hdBjJ2k+yYHQ==
To:     linux-input@vger.kernel.org
From:   Job Noorman <job@noorman.info>
Reply-To: Job Noorman <job@noorman.info>
Subject: Question: input_ff_create_memless synchronization
Message-ID: <CLS4GBA6ROU5.3CJMX42BWA8B5@ancom>
Feedback-ID: 14439221:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi all,

While creating a driver for a haptics device, I started looking at
existing consumers of `input_ff_create_memless` to learn how this API is
typically used. All drivers in drivers/input/misc that use this API
follow the same structure (code heavily simplified):

```
probe() {
    input_ff_create_memless(play);
    INIT_WORK(work);
}

play(data, effect) {
    data->strength =3D calc_strength(effect);
    schedule_work(work);
}

work(data) {
    do_device_io(data->strength);
}
```

My question is about the lack of synchronization on `data` between
`play` and `work` (none of the drivers I found use any kind of
synchronization).

As far as I understand, `play` is called in the context of a timer
softirq and `work` on a workqueue. So it seems possible that `play` is
executed while a previously scheduled `work` is still running or hasn't
even started yet. I see two potential problems when this would happen:

1. A race on `data->strength`;
2. Missed effect updates: if `work` hasn't finished yet when `play` is
   called again, `schedule_work` will not schedule it. In the worst
   case, we could miss the disabling of an effect.

Is this analysis correct? If not, what am I missing? If so, what would
be the correct way to synchronize? (1. seems easy enough but 2. might
need to involve `flush_work` to implement properly and I'm not sure if
it's ok to call that from a softirq context.)

Best,
Job

