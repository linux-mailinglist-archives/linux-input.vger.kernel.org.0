Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5D74AE4B5
	for <lists+linux-input@lfdr.de>; Tue,  8 Feb 2022 23:37:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240529AbiBHWhF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Feb 2022 17:37:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386485AbiBHWe0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Feb 2022 17:34:26 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7962BC04A524
        for <linux-input@vger.kernel.org>; Tue,  8 Feb 2022 14:27:12 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id e3so941195wra.0
        for <linux-input@vger.kernel.org>; Tue, 08 Feb 2022 14:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=OeSSZKbIFhTgOEzgB5zX30mQMKUauJP4uqHZyc5ssI0=;
        b=SbLK/4qWtk/BT3mSCHPWz+zgCwjYn/7nIy+2+SjzOp4KS/AckZ+ITjRQyvdlyLChlt
         8p0heWwi6FRmBcBwYupJqRLGBoHBLqshz45xNGIfdrxp7Ibswa3oCwDAnBvgUCFtlvwo
         4H9FZrsXYcjbbZeyI7XTSNFsF+1Tddx6FQpkdf7IS069/gQoeaOfTelTb2HSpwwkn0XB
         W9sLVq+IIGZoEg+91pjP0qwS/Ur4rB6kFpU+nytnsddbepJb85r6lps/TWHBY6HRJGtp
         EKu05n9GeSuvasTg4Yf24hFCqyC3NIYM4b///0Fa02yWHSnmHfKpAifo44SmmjFflvdk
         o9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=OeSSZKbIFhTgOEzgB5zX30mQMKUauJP4uqHZyc5ssI0=;
        b=HlhQ8aeIXQlL9DXb45l/VTjf83YxZczFYmTqVIB8UGO5OnO77BzUwvD+3Z4Xab8BJv
         eQwZgmnUZt1ykl/dhS58c2ChbSASNRRURHRrQKudbx4Qt5uZ7BFU/8jFAgPYm22D1HyM
         QxDRFKGCrNj9YLSGI2hQp503IcHGEKiP8O93JvURB8G+v2A3ojtZSvFDWwRShnXJxQdH
         mRdKS3aqRAfR/IQhUolaQ50x0Mgcbo13HLjXgKlQpNmXSLSRY6whlEUN3xWHdApyYm3u
         SimsFBovlBQMdJsO1lzcGAo+iJ3mrbQBRaPFMv5WZ8AvbwIsDQmLjHwoM3185fHZg/lW
         PaeQ==
X-Gm-Message-State: AOAM532LCBcFPR7+jfI/dgvAkIeo+P8U9f7QFSPPKC3Z+ru27oHO35r9
        XzfjxQVhhaFE4P0pVV42iC+rS6VD+FKW5XuDUeOWGn/YDWY=
X-Google-Smtp-Source: ABdhPJxzswxqRoNXfffyhQfayMYIIl8jyjkc8sWJsZDnWzmBIJ7GBBDUDzKhUyvDMuBiln57EGGz4KhuqW2TYuz3Drg=
X-Received: by 2002:a5d:6489:: with SMTP id o9mr4917457wri.628.1644359230839;
 Tue, 08 Feb 2022 14:27:10 -0800 (PST)
MIME-Version: 1.0
From:   The Cheaterman <the.cheaterman@gmail.com>
Date:   Tue, 8 Feb 2022 23:26:35 +0100
Message-ID: <CAOpBwpxyDJsqTrwRq-d0pmSGibcgiDf+-EeOMtQ=o8KfUU4beg@mail.gmail.com>
Subject: Re: [PATCH] HID: hid-input: avoid splitting keyboard, system and
 consumer controls
To:     linux-input@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000d6713c05d78937c8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--000000000000d6713c05d78937c8
Content-Type: text/plain; charset="UTF-8"

Hello,

This breaks userspace. Now XkbLayout in xorg.conf.d is ignored for my
keyboard 0d62:3740 Darfon Electronics Corp. (built into my laptop)

Attached a simple patch that fixes the issue. Obviously, a revert is
probably a better idea ; or even better yet, do the part that was kept
aside to "keep the code simple".

Given this is happening on a consumer laptop (Alienware m15 R6), I'm
probably not the only one with this issue.

Thanks for reading.

--000000000000d6713c05d78937c8
Content-Type: text/x-patch; charset="US-ASCII"; name="0001-fix-keyboard-layout.patch"
Content-Disposition: attachment; filename="0001-fix-keyboard-layout.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kzep0ad50>
X-Attachment-Id: f_kzep0ad50

LS0tIGEvaGlkLWlucHV0LmMJMjAyMi0wMi0wOCAyMjo1NjoxMC44NTAwMDAwMjIgKzAxMDAKKysr
IGIvaGlkLWlucHV0LmMJMjAyMi0wMi0wOCAyMjo1NjoxNS43MzcwMjE2MTEgKzAxMDAKQEAgLTE5
MDQsMTYgKzE5MDQsNiBAQAogCWxpc3RfZm9yX2VhY2hfZW50cnkoaGlkaW5wdXQsICZoaWQtPmlu
cHV0cywgbGlzdCkgewogCQlpZiAoaGlkaW5wdXQtPmFwcGxpY2F0aW9uID09IHJlcG9ydC0+YXBw
bGljYXRpb24pCiAJCQlyZXR1cm4gaGlkaW5wdXQ7Ci0KLQkJLyoKLQkJICogS2VlcCBTeXN0ZW1D
b250cm9sIGFuZCBDb25zdW1lckNvbnRyb2wgYXBwbGljYXRpb25zIHRvZ2V0aGVyCi0JCSAqIHdp
dGggdGhlIG1haW4ga2V5Ym9hcmQsIGlmIHByZXNlbnQuCi0JCSAqLwotCQlpZiAoKHJlcG9ydC0+
YXBwbGljYXRpb24gPT0gSElEX0dEX1NZU1RFTV9DT05UUk9MIHx8Ci0JCSAgICAgcmVwb3J0LT5h
cHBsaWNhdGlvbiA9PSBISURfQ1BfQ09OU1VNRVJfQ09OVFJPTCkgJiYKLQkJICAgIGhpZGlucHV0
LT5hcHBsaWNhdGlvbiA9PSBISURfR0RfS0VZQk9BUkQpIHsKLQkJCXJldHVybiBoaWRpbnB1dDsK
LQkJfQogCX0KIAogCXJldHVybiBOVUxMOwo=
--000000000000d6713c05d78937c8--
