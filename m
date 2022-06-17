Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35A8D54F65D
	for <lists+linux-input@lfdr.de>; Fri, 17 Jun 2022 13:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380847AbiFQLIr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Jun 2022 07:08:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382440AbiFQLIo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Jun 2022 07:08:44 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C3A766AE4
        for <linux-input@vger.kernel.org>; Fri, 17 Jun 2022 04:08:42 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id e4so4382955ljl.1
        for <linux-input@vger.kernel.org>; Fri, 17 Jun 2022 04:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=QhDPAyBEgjG30ZNB1QG+5KscXu+11jNBtoMAgRiCaIk=;
        b=hMzceDYPGDCcx/LczfTUsb20SiC8sxngRLruiS4k3FP1TJibE7WSrgHHWo7kkr58os
         JmTTwCngBWXXsFbKHKs2LQXFuUHUmwFFsBr8WZBJ5fpXeVxojusMoKBQG/SEMHN+CHmk
         kXZCcp8EA0O1jKfWikFTiAbPAyFhs2aVmAq4tl6Tk2WEJLJnRVmu7ti54dvYUUgUBobg
         eMtAInMrjhSPFYLE3ykIrYmLu+u0T14/rMuiRfzyA71XnoM6rnqTf5RRVKK3qzoqleEa
         LBT6UeKmzBXtSIHEzHaiHGgj/n9G3dEIv7xFMxaQPUiGGx7/H8WL+4e5oH+ZbYexgWDj
         tlUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=QhDPAyBEgjG30ZNB1QG+5KscXu+11jNBtoMAgRiCaIk=;
        b=zooJxPSAZ5eq2703MMhEx0CSWX2HSjmUIyvCm8RkDRtBal2oxr7bKqDE21zdPXVrFG
         gVR386rS6sLgZLzXvnNGJdUp51z2h8ZJUpLQ6CKBLCykNerQO3EThgC7vA27r0BmHX6l
         D/2VX6BUYNTKWE3DtcUKFE0jZwG2oqAXzCu5pRO+Ko6XZRW8Waj2akK8K3CvgybtJuRK
         MVggOVFe76tArMwxhp5VcfeXtGgPKbbkVXQoqn9ASWG9Eviz49CsvzbCWb4PSUGc2YK0
         em6wo61DycObW9W3ZBvlNhutQ6jdpUJKcLHDWXz6wRSNZHQMC+fpO8h04EmI2Y2wGHeO
         +Q3g==
X-Gm-Message-State: AJIora/0qIUwjR+NDLG93iEsUYrzHV2p/MIy/z1NWRABBvdZmIx9hO5G
        t4a723QZEmHdfOi+E4xxYT5K4VRurttIOf145ofb9Zdg5t4qhCrWIy4=
X-Google-Smtp-Source: AGRyM1ugQiLrlsQAi0RMBq73O5rxac4EWqVr62t7OQl+a9pWxg1vT+nqTncNtp/GmNlwWh5g0hVZ6jHF84Z5zDcZnX8=
X-Received: by 2002:a2e:b168:0:b0:255:b134:99d9 with SMTP id
 a8-20020a2eb168000000b00255b13499d9mr4844496ljm.64.1655464120265; Fri, 17 Jun
 2022 04:08:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:680f:0:0:0:0:0 with HTTP; Fri, 17 Jun 2022 04:08:39
 -0700 (PDT)
Reply-To: sj7209917@gmail.com
From:   Joseph smith <maelyskpeta@gmail.com>
Date:   Fri, 17 Jun 2022 04:08:39 -0700
Message-ID: <CACKGxpyWtNL=ArjKsmYxS0sTXA1iyMwGSjVCwya-wE0mkQVFyA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi   are you available to  speak now  Thanks
