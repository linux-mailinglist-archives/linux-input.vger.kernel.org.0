Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9B6C6DAC90
	for <lists+linux-input@lfdr.de>; Fri,  7 Apr 2023 14:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbjDGMTD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Apr 2023 08:19:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232458AbjDGMTC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Apr 2023 08:19:02 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F3C0976D
        for <linux-input@vger.kernel.org>; Fri,  7 Apr 2023 05:19:01 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id e9so28109125ljq.4
        for <linux-input@vger.kernel.org>; Fri, 07 Apr 2023 05:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680869939; x=1683461939;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vE40mJuVkISt0zg8IVAmmNvtPq9ArtEbvKSLEgCOttk=;
        b=UVVIJKsnMck+Lq5lIyqGG98FIurrnJx27BQ0nOS+B6b1jaBIVBGCI18v6f4+Zzg8Vm
         QTFmprJZqcHc+32Gv3vBTLX0puKofzvYSiuMr6GAKrOta7ZqAzrXREHGDtxr62qm+Wv8
         x9dKl2sVC8ssHzp4k84WTqvmriyuIfbpFtmrmdiXp8rGu7JtswtG/IghIdn+iw/A3G/0
         EqkEJyJphjXkr2ueW5Sar9Vl/n5c0JRPAd0qKHsP/+CZWiJgULtlz8y8inVsNsOgM93K
         hYrI+DehJapVpO484RIrcOsRz6ypCiQajCyfPDnelLKKzThBnC7TCpiLfmLxD16vWQ/g
         YwJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680869939; x=1683461939;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vE40mJuVkISt0zg8IVAmmNvtPq9ArtEbvKSLEgCOttk=;
        b=VDu+jsVofU4ae8ZvGElGxYZ9YomzDIKSIF1zeQxQG7boEwrs8Q8kMTST0lgUXzusyW
         zVp7Sp1yaAFpGwni0AOyuC+z6PEX8U+T0PDWU1DeStQhGvfiYpJx1ZPKy4JOFHjpYOBJ
         I2lDXNgWlbD581Nzn//IVNhV6yxg/50LVpRJ5IblifMG17YsDPmW3/Hpkh6yQdPJpzDd
         EifTRPSwAbmCaPEAqUFwDDRDis/QmHT9NasNqvUVe+vKUhLBQcTJo2mG4JyfHOVmpcNz
         8Ag2LGuSMtoOypjUk9NVA9UrAwi/QyRvAJFwwGI/c0wWqGz0Y2UtGjAs+zN5YW79Uv9Q
         y46w==
X-Gm-Message-State: AAQBX9cIpf7QmGcOxTLJLi+Z3FftypOIU30a9ZOl3NPBN4m6pIVZx8Of
        7q+ZqEY72xb2BtY8yqtWlKZr6aRszwc2Y9/pYLw=
X-Google-Smtp-Source: AKy350bENQDL0dixTzwSxe3/RM/z23K2+eE/PMsZSSqsbHfy9WJSit+LZa3mHS1fa9Po1fz2XBkien+gqxEvU7+X5Pw=
X-Received: by 2002:a2e:9195:0:b0:298:b375:ace9 with SMTP id
 f21-20020a2e9195000000b00298b375ace9mr532673ljg.9.1680869939136; Fri, 07 Apr
 2023 05:18:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:6257:0:b0:224:2f90:549e with HTTP; Fri, 7 Apr 2023
 05:18:58 -0700 (PDT)
Reply-To: saguadshj564@gmail.com
From:   MS NADAGE LASSOU <pjihin96@gmail.com>
Date:   Fri, 7 Apr 2023 13:18:58 +0100
Message-ID: <CADXuY1e914AYteqYfNE0ndn16vpPqGtcQB5w0fn9ZjA8HVpmKQ@mail.gmail.com>
Subject: PLEASE REPLY BACK URGENT
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Greetings.

I am Ms Nadage Lassou,I have something important to discuss with you.
i will send you the details once i hear from you.
Thanks,
Ms Nadage Lassou
