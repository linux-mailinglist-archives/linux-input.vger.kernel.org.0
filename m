Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 972CB5555AA
	for <lists+linux-input@lfdr.de>; Wed, 22 Jun 2022 23:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348868AbiFVVBc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Jun 2022 17:01:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbiFVVBb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Jun 2022 17:01:31 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E85812458A
        for <linux-input@vger.kernel.org>; Wed, 22 Jun 2022 14:01:30 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-3178ea840easo137318827b3.13
        for <linux-input@vger.kernel.org>; Wed, 22 Jun 2022 14:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=mJIlQiW7HQxpfhemEhaLZ8lUqA4CdzaEwLQeNlrWZmA=;
        b=MrUzrOCR2ZC0iO8r+7WApD2mEx2UBX/6KDCaBpCooSIxyqFKrtT40ujx/GtlFKO2Vj
         vTnsJX9NAZpTx0EWRum9rPumc1/Swc+6WnYRnWQt3b6WllWt9JCj6KQOZwV3/Qwgb9wD
         LUwGT+gHMo/etlHVX8SW/DhI8Tu5vEao2AfxsnlFZUE7Rx5l3fF1PYzB4Fz2tGCcyyGD
         RtDHwtL87uVTFh4ge9igde7aqxaIx615X1l0nQTNkGnLkkvR5w7cX4t37fUeFAHd8kJA
         C6ftermRc/C06NX5fmMT1cTLAre3t6dSZGnKC3EdOA98SdF3Xk0FCHN1wzAa/c6gur6j
         9gRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=mJIlQiW7HQxpfhemEhaLZ8lUqA4CdzaEwLQeNlrWZmA=;
        b=Zs6iBP8vMVkXsQqI+Oovrp3Ugsso1359STsjM2avwacxJ5U/huF23cIhuAqlOXlM4p
         iIgPYhtJeMV0BY4fWfVYXMnTxpO1ZfBrEjTF3LR7XREcS3NW+q5AyKthdMGjdzhiHP0+
         zSJnTZ2ipfsynOot3aad8HWdEa4ykIBpymJQb1jd+0a0Bx0AyB4cu05/mg7gZI0YH8wu
         88F20/tH7jYjMukdlDIsG0nPKxZn8H8DxxDWWb8fJi9UGPCDV0IKhOVN7NQDxsmbux0D
         vrsz5ZTQZAqYq3pWcxbJkoQ2FMeHGNV5VeW1DI0NxfJRIloUeB+ddqQkCtd40N8ojtb1
         jhHA==
X-Gm-Message-State: AJIora9KioqjZCTpvGwhjw9MNbM5qNHTG5HFIcJeU1vfSr/Qke/QcQ94
        4M4uZpxZzMOqnNoESRm/jokipbogK8EvqlgRbhw=
X-Google-Smtp-Source: AGRyM1s45YdCqX/gXqFl5baAXVSNxHNX9nNs/GqttZLf38/cOlFh5Q2P4Gczu6iRWXUFlUcOeC1McesM+7CIeleg4UU=
X-Received: by 2002:a81:5296:0:b0:318:14f8:11fc with SMTP id
 g144-20020a815296000000b0031814f811fcmr6756962ywb.210.1655931690129; Wed, 22
 Jun 2022 14:01:30 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sgtkaylama@gmail.com
Sender: elraouf303@gmail.com
Received: by 2002:a05:7108:8250:0:0:0:0 with HTTP; Wed, 22 Jun 2022 14:01:29
 -0700 (PDT)
From:   sgtkaylama <sgtkaylama@gmail.com>
Date:   Wed, 22 Jun 2022 21:01:29 +0000
X-Google-Sender-Auth: vk7sNNK3JIJFZJ2FbJZFyPzFOeM
Message-ID: <CAO+1egkhSrjPTv05J2_c13r7stthtDDB4Pv-w2q4BEiT-nGz-w@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Sveika, m=C4=AB=C4=BC=C4=81, k=C4=81 tev g=C4=81ja? Ceru, ka tev iet labi? =
Es neesmu no jums
dzird=C4=93jis par manu p=C4=93d=C4=93jo zi=C5=86ojumu. L=C5=ABdzu, p=C4=81=
rbaudiet un atbildiet
man.

Ar laba v=C4=93l=C4=93jumiem.
Sgt. Kala Mentijs
