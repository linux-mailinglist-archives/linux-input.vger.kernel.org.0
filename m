Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8988B608480
	for <lists+linux-input@lfdr.de>; Sat, 22 Oct 2022 07:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbiJVFWA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 22 Oct 2022 01:22:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbiJVFV6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 22 Oct 2022 01:21:58 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A35B12ACBF8
        for <linux-input@vger.kernel.org>; Fri, 21 Oct 2022 22:21:46 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id bh7-20020a05600c3d0700b003c6fb3b2052so3355304wmb.2
        for <linux-input@vger.kernel.org>; Fri, 21 Oct 2022 22:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FEIYobGMvwGWUPCst2vtZ0sdZcAAz70R//HIPG+sCM4=;
        b=EN8n96nCsLdH/BhDRKS2DDD0MVZYLgusRQThGFVPGuprTRfE6hpyhZaCh07pY9a7Xz
         zmQxMvfEqQDIE5cbzxR2xQ6scv03FTToj9gDYjvEIw/RbGno9LH8Ho7n6xUpk9IgvKuF
         Nuf4CyZ8y4bMAXmdRwAMDBi22F0CLWD3HpoETju2N6K381LKE8D+pNUPn2uxkDXHGUdh
         eDvadoe42sla2n1i+I8F3QNycfdUUpmyrHFbIEN1lRsP/BdrgTe94ruGE9ytt74iS9pE
         gDk7OKiUVIYyEMgpErYxJ5X5I9vphWytGYnOxb3cgoIiv+dUWkYfpDUKsNndre9N+S3x
         ZtCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FEIYobGMvwGWUPCst2vtZ0sdZcAAz70R//HIPG+sCM4=;
        b=Vx1LJ7E9pStjjIdHzwoAcaqtJ9DI540GRfYMgjatqEGVi/qxB5i9xX0lwXUr0tUdSz
         HnG2eFmytI4AeasmP6UzQOqtwveDTIUjaQskqxWLsskDg57SShMmgvuY+rF5Dq7/i4u/
         j/AgzxuFNssZhs12qvdck3tP4kEeJzJ/mwmpGc3pVAnxT79BYvGNMCyDAuTOxpsRjvh4
         Z8PE++KKA7BMb/Trq/oih3wKfoNhCJpCDffYEal30VxCSOSA4w/zcc99llUDHF9mVdEf
         Vo3d+ee92ALWgWuFeR/Lv6tqKl7do27aC/41xGb5BQTv78kBvOXRpq3az+DlZFoD9oWG
         CMqw==
X-Gm-Message-State: ACrzQf2gfn+1Fvp9rwAnyKHNn0mqgNTPc9uT0hVqjwhV90GeZ4qSygjF
        FQ9oMwmRR7IC359FLjR/QLh2ed3M1T6Ez4J/9NIJbv/F
X-Google-Smtp-Source: AMsMyM4mb06627EgLJg5wmlBEXGlsCCYQwBJIyn9QmpjB1AzZaUBksGh1sQP6VKUnHcIwquvPZiWxHqkp9M3v8mTKbU=
X-Received: by 2002:a1c:f009:0:b0:3b4:9398:49c9 with SMTP id
 a9-20020a1cf009000000b003b4939849c9mr36184347wmb.174.1666416104469; Fri, 21
 Oct 2022 22:21:44 -0700 (PDT)
MIME-Version: 1.0
From:   Travis Geery <geerbot3@gmail.com>
Date:   Fri, 21 Oct 2022 22:21:33 -0700
Message-ID: <CA+mLQwBzPLLp7WK4ZC9Mzeuv04GbStsyiVKtgUbm95buUpswPA@mail.gmail.com>
Subject: 
To:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLY,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        TVD_SPACE_RATIO autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

unsubscribe linux-input tpgeery@gmail.com
