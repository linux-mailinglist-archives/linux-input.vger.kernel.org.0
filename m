Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F03E61F323
	for <lists+linux-input@lfdr.de>; Mon,  7 Nov 2022 13:27:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232241AbiKGM1p (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Nov 2022 07:27:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231643AbiKGM1k (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Nov 2022 07:27:40 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11A911ADBB
        for <linux-input@vger.kernel.org>; Mon,  7 Nov 2022 04:27:37 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id y4so10919756plb.2
        for <linux-input@vger.kernel.org>; Mon, 07 Nov 2022 04:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZVkFn3YwdxEdThkVHM6Q9Cxc1dE09qwtEAvH/ySM1g=;
        b=LRwwH1QEKtWXDJVLYrGRK7z3Ea0uk73OgwVljiDBjULr+E5iJFgrW1JE5GWr6HS1dn
         BnXRQtq4x0mpkzJShtw3nnXySQneI47XXe78iKKh4PvquU4U3OWR2dhIGF5Xhcx1Fm6R
         3wE0nsODgXWOKjUYKLhO8n7D84MFbGcPfqHQFGR+xBB7tsBtIy1wY3+5u1yf1PoyXiMH
         pZCgWdkhX2qcnOVOLtLAW5iCqurQX7Gn3kl7US3yWEONeY0uPMhEYxNhHMElwp3Je6Sz
         x7HdfuC/mr48N/x8uVwKo4N6jKoxFzbB/Ci4wm41NyMEaQ6wds1nexmgvBd2FH3G0tjh
         OFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XZVkFn3YwdxEdThkVHM6Q9Cxc1dE09qwtEAvH/ySM1g=;
        b=0TS1gQq5gEY/pTCVdkDjz7FexGBcWc1YhUi95Z5+viiCs6o/kLUBfeloKFr7Y+gPZE
         ZnZM84BQZg60fJrRaFldHvtxX+21zghlGExK8focuNc+Bb6iXdrhzztdOL3abFkn3I0G
         ts0XDj8pCdImDinw4Vsf35eO3qEdPRR8BS6ITeURWsqaLJU1Tn9Bn1Rg992K3A5dbhJB
         Q5R4gy+EJcu81+V0AB7W1uF5E1TDxRxJ4T+3Wva3d3edHj4/Z3h59IDQt4gspR64Rk52
         Rzfrq3A5QntMmI8ceyrYxKJ7Ho0DGcDx/QOF8TlCk9I4+2w/lQck8FyrA022ZpB4V3x5
         pg8g==
X-Gm-Message-State: ACrzQf1xrFjgDhDMUCfnK8hg2ezXhSJRp8fIACZqRnw4c87p9qqM+DhA
        k7h1ryyK23Z01iv4arLCIdA967FpRW/tdnAkzRE=
X-Google-Smtp-Source: AMsMyM6LJ2N3JAD0N1IH68lzjcr5IzQcgdLgAuHJWTWEqhQW7/w3oKrCy9dvQsOfm1C/mszepFaIQmu6/aeDk8XfJQc=
X-Received: by 2002:a17:90a:9902:b0:213:1122:feb9 with SMTP id
 b2-20020a17090a990200b002131122feb9mr50181608pjp.58.1667824056569; Mon, 07
 Nov 2022 04:27:36 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7300:ec03:b0:83:7a55:bdae with HTTP; Mon, 7 Nov 2022
 04:27:36 -0800 (PST)
Reply-To: sgtkaylam28@gmail.com
From:   Sgt kayla Manthey <adossirobert@gmail.com>
Date:   Mon, 7 Nov 2022 12:27:36 +0000
Message-ID: <CAMAp8G978ahekUN15euMeJn6H+bNqsd=6LbZLotH2u5gznOeJw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

-- 
Hello,
Please did you receive my previous letter? write me back
