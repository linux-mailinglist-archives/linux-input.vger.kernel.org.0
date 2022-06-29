Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1FA560263
	for <lists+linux-input@lfdr.de>; Wed, 29 Jun 2022 16:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbiF2OQ6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Jun 2022 10:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbiF2OQ4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Jun 2022 10:16:56 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B2103152D
        for <linux-input@vger.kernel.org>; Wed, 29 Jun 2022 07:16:55 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id v9so7107333wrp.7
        for <linux-input@vger.kernel.org>; Wed, 29 Jun 2022 07:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to;
        bh=vYc8OI8aKFBkOdpTUZLPMIgDfVBQgzr4QYoq3g5KO7c=;
        b=kSXixZ0sKQAtdancSL/BPZKx2h+lAXVPuoDvN9Yp+zoXLWUaUASPzxYAZVCJKYvifV
         8qpbu+qJ0D80ueFpVGSUlVNYeXZqFjKpfytyQmpuOgpWvjjO/j8KpnAUg13WRRUOBW7p
         ExcjLaN46BW9/axGMa8PRb2oLFfn4XjMlezyWNNArjC7fpHl67FOzaKUHqWebro+olfy
         jPUty8CPRstkrOFjGgI86hKOXIUpVJdCRkEalTS5yB+onRraMW1ymfLoBmHkGQMCU90F
         OoDPSU3XSAMT8KqF++YYaJTrPU2qvAh2Lq0C/Q6g4AeyZNXryKGs/GaHBhj4beg8nGpP
         Y+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to;
        bh=vYc8OI8aKFBkOdpTUZLPMIgDfVBQgzr4QYoq3g5KO7c=;
        b=iS8pbbd1Yhu2Bvh5IpOWiDrkKOOb0jGyF2yqzmtp8asc/UdFfBmO/DXTEdDYkNqAo4
         ZWjIbdWkywOeQmmcQ6FT/dOV9jw2b2lhb5EMNsiyk9vlbT42A7j5GlFHCc/saMxcIhLX
         Ld+EHxfXpzBg4vigw+uW9eQKdJmQ/fI+3YYnYEKjH+L26YnO1eqZ/UC1eKUPmKUUD+9c
         mdvHLgEzU7uZ8aJFRGzuJSR2pVnNQnQp7Y7JDzOims0eHWLOPM8dtn/UxjWYtXj5ucNT
         tVyfHZQQqGZZ7zs5S80Rqyxh3x3qj72dYSslEQHmZ2tUX5hIdjQ8dLYMPkPej3xySzOO
         6kVg==
X-Gm-Message-State: AJIora+Q5rULDh3+G1GhnshCXvR752hCd+6engpUJG+Hj8s7kCszpx08
        taVT2PUW1rvVXbUGTspfIhfLHHNTPk37pg+To6o=
X-Google-Smtp-Source: AGRyM1sKtDIbrmMVh/QUeaA0SeVcOwLVw54W8l3Jz9H3N512DAisIMF7VuaTmSPQEQ9cE70icqE6OtzddEWeoQCoGxQ=
X-Received: by 2002:a5d:64ae:0:b0:21b:b923:7ad5 with SMTP id
 m14-20020a5d64ae000000b0021bb9237ad5mr3280310wrp.460.1656512214098; Wed, 29
 Jun 2022 07:16:54 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sgtkaylamanthey612@gmail.com
Sender: gregorypaul612@gmail.com
Received: by 2002:a5d:4a12:0:0:0:0:0 with HTTP; Wed, 29 Jun 2022 07:16:53
 -0700 (PDT)
From:   Kayla Manthey <sgtkaylamanthey612@gmail.com>
Date:   Wed, 29 Jun 2022 14:16:53 +0000
X-Google-Sender-Auth: 84fiBn9JsrDmEYY22_kXuRIjlYE
Message-ID: <CAD-66CbiZKVW9-T64K=agvGxPSYwO-FzN=3+gdPo0icBmvfFQA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.3 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Groetjes, ik hoop dat het goed met je gaat. Ik heb geen reactie van u
ontvangen met betrekking tot mijn eerdere e-mails, controleer en
beantwoord mij.

Greetings, I hope you're OK. I haven't receive a response from you in
regards to my previous emails, please check and reply me.
