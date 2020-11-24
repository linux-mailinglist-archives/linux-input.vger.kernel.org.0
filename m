Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25ED32C2BAA
	for <lists+linux-input@lfdr.de>; Tue, 24 Nov 2020 16:46:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389803AbgKXPpP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Nov 2020 10:45:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389799AbgKXPpP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Nov 2020 10:45:15 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAC81C0613D6
        for <linux-input@vger.kernel.org>; Tue, 24 Nov 2020 07:45:13 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id a9so29527717lfh.2
        for <linux-input@vger.kernel.org>; Tue, 24 Nov 2020 07:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=JwWq5JGhKrq0fQjX+abmUvyg4pLULlEVHjNuHdjUPAQ=;
        b=c4XSA5adRMFwDflUKbZrj+pZfeYC12FvGOItGord4whbxDMCx9gsMkiX514zDNq/71
         z/rwSL6Ll2X+teNTEI4tlrX1uCNSihN2HNzXNt/ljTK9guAZe7etbJ2R1idSnkrvTvGh
         pXjcA3MOG0xgGXNjQiYtXiHuChaChIR3FNaCqD8j3utnI/2l+i/C5s5oUFCrWTbuCDAT
         aTUUN5Tf2CG5dh18xsaM8M5Kt2q1rWK1AiSG5Gy/3FwLaPBg1dDRPuHPUZ7x5xQbYEXP
         iY9C0iUDwBL8XHySFEEbss/MGWarb44U9PeADoxValrvpNrR668dc2JXNmEe2k/WETmf
         Q24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=JwWq5JGhKrq0fQjX+abmUvyg4pLULlEVHjNuHdjUPAQ=;
        b=DQ2zqRHR0UYRAc5OcSO/pfZkdLkPFxm4U9dEcq0wg/Z3WbGA6bASDB8jqxSk5IQqap
         Yy41DpPVI1jqCAoszCPSW/4NEerNAEPLB9CHegixXA0OzpPcoJBy7f0VUqS29gWwDd46
         3do6mRHytSI22EhKPtRtm9V5lmpoOdT2+vo6BkDAelkNXsMMiO2mUh0VTN3oR9iuwNAw
         2gHG2Sc1PDvc7rhfYXv/0ef1Qi30d+XiZ9BnnoEpjD+4MxEftv6P3anzjhJer/HWw/l+
         iHRGuj+idbjc4d2+/6lN/5YhTYFlyFPUAyPkqgQA3m+KZM1fAftKgQ4NjnKDDb8oXudF
         uhKQ==
X-Gm-Message-State: AOAM531HTgyKzc40YTZdF2amYulQdBIc/UqjEucE0j0lgctixVH2VKUJ
        BYRMVJ0zm1azxriAB+d0u8MKyjWW4J4U0E62s0g=
X-Google-Smtp-Source: ABdhPJy42qhfqdDH3FLMeonCnuNXgxr5KkIv0KPvBVzVbhE1rVzZMq+K4QGYt5EgzgxhIflOcZp+olNkXc1cwUrx2sc=
X-Received: by 2002:ac2:4349:: with SMTP id o9mr1887585lfl.194.1606232712206;
 Tue, 24 Nov 2020 07:45:12 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a19:6b0e:0:0:0:0:0 with HTTP; Tue, 24 Nov 2020 07:45:11
 -0800 (PST)
Reply-To: julianmarshalls@yahoo.com
From:   "Julian Marshall, Esq." <jr77hy@gmail.com>
Date:   Tue, 24 Nov 2020 07:45:11 -0800
Message-ID: <CAKMjQs6JbzHnuJzXcny64=+CONO8EeohDDKtJu25UVe=cF3NJA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Ich habe mich wegen der mit dieser Frage verbundenen Dringlichkeit
entschlossen, Sie zu kontaktieren. Ich bin Julian Marshall,
Rechtsanwalt. Ich pers=C3=B6nlich bin ein Treuhandagent von Dr. Edwin,
einem weithin bekannten unabh=C3=A4ngigen Auftragnehmer hier in Lome Togo,
der mit seiner Frau und seiner einzigen Tochter bei einem Autounfall
starb. Ich habe Sie kontaktiert, um mich bei der R=C3=BCckf=C3=BChrung von =
zwei
Millionen f=C3=BCnfhunderttausend Dollar auf Ihr Konto zu unterst=C3=BCtzen=
.
Bitte kontaktieren Sie mich f=C3=BCr weitere Informationen zu diesem Thema.
