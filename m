Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D44868ACF3
	for <lists+linux-input@lfdr.de>; Sat,  4 Feb 2023 23:57:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbjBDW5I (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 Feb 2023 17:57:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbjBDW5H (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 4 Feb 2023 17:57:07 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC67A26CDC
        for <linux-input@vger.kernel.org>; Sat,  4 Feb 2023 14:57:06 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id v13so8337749eda.11
        for <linux-input@vger.kernel.org>; Sat, 04 Feb 2023 14:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYBdSnATUWMl7OrRUexNOS9yLXpWnh++iwl+4xO2WaQ=;
        b=DarmX8eEK/lqLqB0LecarZ8lKUiwIfmKd4andMUJZyZtVV+AKxCEbvfQ3tBcx3TI1v
         /exc6wnYiQHUEvYFOwXYNEXPraJS37teB0y18Ujeu+9aIe4BTyZEvMRKVqR44KmH+Wu4
         Gs/O3hyOb6eVk2WEFHe1h65vg9d7j5UGO+Vlr4bGVrY7QYLJzERkzZ5Nxwn8z2EUsOx1
         YDSSLW2DCte0vb4SFZPVvq2R+3mnuT9qMlXX9fNCrdeSaIWq1k7eEJdlwtlfQGvcmIFW
         HSXu4vMDnK5w/gNU0fnms0akOJteFRFB8hXF2JsJBxg9DffuMcSi8n/RLmmJE0NA10pn
         iGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PYBdSnATUWMl7OrRUexNOS9yLXpWnh++iwl+4xO2WaQ=;
        b=NylZ78ws8pEwyEf4/x3RT8gIf6a005r+tLn/kQmzgMxEzuGBXokJ2P0w4znDAIgV73
         UTIdcGAXIx0JOHx8TGAbpkZ3elymzJzKQe8Qsg+gesF3fEpEgxTm3/06JDZBAWPnUBvT
         i+cBSlmEdcwvHa6x8uTACrJ3V1WfrkYtERsqYnclROB6dB3iInKUpIYzIDDE3GtzIo4B
         E8neiX3KHAQ0i1w8LgELwTc/tLXW/JwaN6GUzCl/0kmIROrjetvGKYrQO4ezcCZJGiw2
         MPEd+n/8tNKTUm49zeGl6Q5ludr9LVsR5qRfSLN4Pm8t6zCIl2Vndiu4CHCOm9K0M5B4
         poBQ==
X-Gm-Message-State: AO0yUKXbU8rBDHNlZpoTMib0AX6EWsHtSsej9aqjl+PwTbZehweTQ4v5
        ntZlomBCHHXGc8wCQ+gVcfRnUTcioOApnJyL+Sk=
X-Google-Smtp-Source: AK7set8OX1tVIEZ/tjkw84ZQNabAiHCYsuE7rpxCCgpni3O+2/pkCCk4/6DZPK7JdLXfJKbVQwxNi4nu0cnsWxLfjBo=
X-Received: by 2002:aa7:d5c8:0:b0:49e:65e4:ff24 with SMTP id
 d8-20020aa7d5c8000000b0049e65e4ff24mr4463591eds.26.1675551425247; Sat, 04 Feb
 2023 14:57:05 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7208:2205:b0:60:3fdb:8460 with HTTP; Sat, 4 Feb 2023
 14:57:04 -0800 (PST)
Reply-To: lassounadage5@gmail.com
From:   MS NADAGE LASSOU <info.kosianita@gmail.com>
Date:   Sat, 4 Feb 2023 23:57:04 +0100
Message-ID: <CAM0JKNd=v_0BFw1ShJ88a8DGD+Z3B7C+x5ehLk=t7=N9=Hk65w@mail.gmail.com>
Subject: YOUR URGENT ATTENTION
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        SUBJ_ALL_CAPS,SUBJ_ATTENTION,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:534 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [lassounadage5[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [info.kosianita[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 SUBJ_ATTENTION ATTENTION in Subject
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Greetings.

I am Ms Nadage lassou,I have something important to tell before is too late
Thanks, i will send you the details once i hear from you.
Regards.
Ms Nadage Lassou
