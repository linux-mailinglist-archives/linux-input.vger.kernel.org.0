Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7B6B481DB5
	for <lists+linux-input@lfdr.de>; Thu, 30 Dec 2021 16:31:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234169AbhL3Pbv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Dec 2021 10:31:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232569AbhL3Pbv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Dec 2021 10:31:51 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF0C2C061574
        for <linux-input@vger.kernel.org>; Thu, 30 Dec 2021 07:31:50 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id g13so29009899ljj.10
        for <linux-input@vger.kernel.org>; Thu, 30 Dec 2021 07:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=Genm2kBwggT+tRKC4Ww57neAip8nzQoAltuiY/IW1e0=;
        b=i4Is1732XNx32bu2kA8eXy5A7BN0qPFh3CigW6tT3QrbXoy8P2a0itEX2bWtYC69eq
         2d+Z4xc0BZYfaaNhEKzcMev2OdhLyKR2T/qwCzTarbVvhafOFAFNLQRz2nbGbsuZgNC5
         8R10DFRXuM10Ppx1ep13+uIZOg4IN9ijxO+AEXom8kwogZ+3Jh84FwE6NGdL1PyRaWGN
         QtsqQyE4gHnC9wcKrHZPJA01Ux88z57PrKIBuZdv9O9mQyod7h5xgLVGuH7ZH7vlasxT
         wMf1r5u+xCnWpcZoJp1wKDK7ZJyyfJnnE+kadqlKsyApnY/82HKhokDWwTe2J7Zp88Ui
         FI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=Genm2kBwggT+tRKC4Ww57neAip8nzQoAltuiY/IW1e0=;
        b=RGmW9yOHI2iOT1GUvC8rgWKWxf0cKbroOzQDO+Nre4Key/1xfuh4jBbfAZCKhw+zoU
         7XsHZJqGaYh9m4a//iWk3+qL1Q+FqtnNF/akcOThAF0OZ0IFt+hdoV24BWGL8R6CqCan
         3Nfjg2n1N+6zHfAFETfWCyJb46FRvkUJ2SeuBCSGoFbSV5Oe5rv9kuujHOs/5FKf59TC
         +4OIN/j88Whdk/WXv3HQk19XMnniAo7Ls1RAx5LG80rW2APilqSmDV0nsxQkK5036xUn
         gFfw25RNjZSCsbRu9e2cpE3LCMAmYzisweBKALXzrbfI7NofdrtpdAEDuwkYQ5pBnR00
         kHjg==
X-Gm-Message-State: AOAM533uv51NKQZ4CxjtqEHvUQG92ufBhJ4Ds7YPWJXftRyHFbhAwDDH
        qOCoJ+wvq330t3WEgVVXsQiFX9FXUJ7gGPCT9hU=
X-Received: by 2002:a2e:9886:: with SMTP id b6mt8950324ljj.526.1640878309241;
 Thu, 30 Dec 2021 07:31:49 -0800 (PST)
MIME-Version: 1.0
References: <20211207133603.4947-1-peckishrine@gmail.com>
In-Reply-To: <20211207133603.4947-1-peckishrine@gmail.com>
From:   Desmond Lim <peckishrine@gmail.com>
Date:   Thu, 30 Dec 2021 23:31:37 +0800
Message-ID: <CAHEqh5GQSpyxaZtsNSh477VBpj6Jfyc9g+4CTs+ycgFhFuG94g@mail.gmail.com>
Subject: Re: [PATCH v2] HID: sigmamicro: Fix modifier keys for SiGma Micro
 based keyboards
Cc:     Kinglong Mee <kinglongmee@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Superseded by "[PATCH v3] HID: add SiGma Micro driver"
https://lore.kernel.org/lkml/20211230152758.79104-1-peckishrine@gmail.com/
