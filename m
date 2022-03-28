Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2C854EA2CE
	for <lists+linux-input@lfdr.de>; Tue, 29 Mar 2022 00:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbiC1WR2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Mar 2022 18:17:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230021AbiC1WQj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Mar 2022 18:16:39 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A2E515AAD2
        for <linux-input@vger.kernel.org>; Mon, 28 Mar 2022 15:13:03 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id yy13so31497801ejb.2
        for <linux-input@vger.kernel.org>; Mon, 28 Mar 2022 15:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=TD/3LUZgHFDmqN3EiSjzbKNfwgw4oqz8AYDhYsZdbJw=;
        b=aBmyD4p31/Xf7oBZbSgFz3QlT5FttPvFCbnerde3h69mBtCL4zQwnPdObN2WWwRHh+
         2vm1aicGvRz+/ukhpb2yk1XgiU8njMy8Wt+RdDGW+E6H2Sh/EQ+bm7z0+RT7v79UyoQB
         aKjbZhHgBM45TEQTSadmf3/A18yue/GM2Uy+BVrl5EPb5JR3VFfy3mR45xF8azJwp28T
         YKwQi4uGzDWVnyanExU4amM6HfzYsA7P5FvXr4k2YHCDgq48bOoAQD/WWnGwwuU/jgv4
         Zq+SO8BOCmAyKYRKxsbGkT8Lz+JLC+Ijg6e4WbmY5Se8b9swTh/9wVV7l7YU93mG1tOw
         Kz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=TD/3LUZgHFDmqN3EiSjzbKNfwgw4oqz8AYDhYsZdbJw=;
        b=66EdkkV+Nw867NmLsxTpfOp5Y7/umD8rWh+Y0mpNK+dGZuz7nBQVI76a+t2zMcWpu7
         7n2YzFnnUwHjlhvfobA42gbK9hg7YJoGpBuxrUbyd95iirfib9yPgH/TeucGfZ8iT47D
         417LPSNPfgv8ALllelRag9+Giasm/f533UUX+Ztfs6Pzd9sI/z7GwVsCQtLWXMNJKKY0
         7hFMoS1ANoc1jeaadZW7A6Enl5BRHod6dxZGCU93TmZoZPY3QEUK1oFcelk1+yIInbWw
         ej0fdgEZvWkm7XnNOrlTDrPKOjFZ6nhTNMtYg9Mt8b2Fh8qDw2luolmhaees5ktoW0gB
         vIDQ==
X-Gm-Message-State: AOAM532MfENCVGTfXKTAzRdNUC7e2LiJxCSL+T1IqwZxG5jycdGgT5Ue
        VHKJ8c2ZESRWMfj81zr6i8GAK1m++FNDrmfaxcI=
X-Google-Smtp-Source: ABdhPJwtsV5Kchn+KJWcyJup+pdO2w20Vz8un5e9R9ZTvYHyzXuHgI3JohdGnmxM0e9nc3wFl09ot0MbAGD1+hpC2xY=
X-Received: by 2002:a17:906:b102:b0:6db:1487:e73 with SMTP id
 u2-20020a170906b10200b006db14870e73mr29245385ejy.474.1648505581930; Mon, 28
 Mar 2022 15:13:01 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sgtkalamanthey@gmail.com
Sender: amegeejustineablavi@gmail.com
Received: by 2002:ab4:a12c:0:0:0:0:0 with HTTP; Mon, 28 Mar 2022 15:13:01
 -0700 (PDT)
From:   kalay manthey <sgtkalamanthey@gmail.com>
Date:   Mon, 28 Mar 2022 22:13:01 +0000
X-Google-Sender-Auth: C_zDPuCtF_reKmq_OLlSNWDSQ8E
Message-ID: <CAOugn_-1TDyG=brAQBYPTkFq+gVf+2rN37rEe0tpiwRmUO-RLA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Sveiki, vai sa=C5=86=C4=93m=C4=81t manas zi=C5=86as? l=C5=ABdzu, p=C4=81rba=
udiet un atbildiet man.
