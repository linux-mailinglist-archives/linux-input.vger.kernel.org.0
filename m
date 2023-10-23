Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD4F7D434B
	for <lists+linux-input@lfdr.de>; Tue, 24 Oct 2023 01:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbjJWXjm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Oct 2023 19:39:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjJWXjl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Oct 2023 19:39:41 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63346D73
        for <linux-input@vger.kernel.org>; Mon, 23 Oct 2023 16:39:37 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5a81ab75f21so38750077b3.2
        for <linux-input@vger.kernel.org>; Mon, 23 Oct 2023 16:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698104376; x=1698709176; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ys73+HDLS38AAwKXBMPRuEWzoNWn3OMFlRtXJuB3sjs=;
        b=Z08+NHHllP4JBKJMm1OH3VU1cSml6cN8ADslXdDqVw1DQ0wUKAQxtfHXUaJfImdQN0
         4lLjmz5gEIHojq0/LxyWahyPNbadj+mMgz65fyUexsLGVT9FzGwBUE8xu85YIbXoAYEX
         3jCoyfTqx+fWVQHhNd5ZXkxZrTwyb9/L1qoiRbwA9DoqB7akl/yp5aPGzaxCXJVnZAUC
         LkbozSKxge8ohQ0k6Oqw/F7VUoCv/nHVVb5E4sIe+mkaAve4cHlkZ+ay/9M5YShM7ai1
         3xW84zFhZMdletTZ+YdWgj3oAdq9SiKc3fmbmu82Cri9eGwoJz7D+fi1QjBdkcZdezep
         zGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698104376; x=1698709176;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ys73+HDLS38AAwKXBMPRuEWzoNWn3OMFlRtXJuB3sjs=;
        b=ZQ6VrDESkkCEQi3FZ6B4KDY5IWcAYtTe/vymSC5l7zjANQ8W1C996uJvI3rnhAGapy
         b510X1DsrbHoNpKq6LJp4SR/ZLJRz4zPUZ77DYBfb5yXHtGCzBxmP7cw9VfmU4cRa70b
         /SA8/2H1tn0ZfXjA13cbBSbog7FaHsd2LOKI3FiWLVSZ78JG1F+4MEKgGNfJuE8vIH6F
         ItCzZTWfde35qFeNgeOBHVV2ol008sWnQuzQqDQIQup5Vh3pEYejDg9k9q5rVl/hmoo7
         ZyMZC18xZ2z7WLKoUYUPwJ8EOczBooHmCSBRFd/47tRnDZdSQxashWI58lTv/Q7kKWbQ
         Ryiw==
X-Gm-Message-State: AOJu0Yx7cTUHZLBtYk51M56AVkH3vme2oJ1A+lsBdwM9UB3s+EV9/iJn
        Y5L4ewNS66zbnJurwOJF092BWC3IymEoLjaOYAY=
X-Google-Smtp-Source: AGHT+IGh2RfY7XpL8tDTdzGjG3Umfiqnwwr7Nx5Am2UiGWrD3C4Nv42ofS2BoNxgja1lWPJru+IFFTf+GttpJWXxLWU=
X-Received: by 2002:a25:2083:0:b0:d7e:8175:4fa9 with SMTP id
 g125-20020a252083000000b00d7e81754fa9mr9707969ybg.4.1698104376653; Mon, 23
 Oct 2023 16:39:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7108:758a:b0:341:7725:752c with HTTP; Mon, 23 Oct 2023
 16:39:36 -0700 (PDT)
Reply-To: tchalimbenson@gmail.com
From:   Benson Tchalim <josefernandez29a@gmail.com>
Date:   Mon, 23 Oct 2023 23:39:36 +0000
Message-ID: <CA+fqxfbFMaHKGMu4hzFJv_keJu0xGxp-C+37y+VwnWwm5RiM=w@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.2 required=5.0 tests=BAYES_99,BAYES_999,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:112f listed in]
        [list.dnswl.org]
        *  0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
        *      [score: 0.9999]
        *  3.5 BAYES_99 BODY: Bayes spam probability is 99 to 100%
        *      [score: 0.9999]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [josefernandez29a[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--=20
Are you still using the same email because i sent you message but no
response what happen?
=E2=80=A6=E2=80=A6=E2=80=A6=E2=80=A6=E2=80=A6=E2=80=A6=E2=80=A6=E2=80=A6=E2=
=80=A6=E2=80=A6=E2=80=A6=E2=80=A6=E2=80=A6=E2=80=A6=E2=80=A6=E2=80=A6=E2=80=
=A6

Verwenden Sie immer noch dieselbe E-Mail-Adresse, weil ich Ihnen eine
Nachricht geschickt habe, aber keine Antwort, was passiert?
