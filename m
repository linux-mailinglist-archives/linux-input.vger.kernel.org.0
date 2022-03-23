Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACA864E5930
	for <lists+linux-input@lfdr.de>; Wed, 23 Mar 2022 20:32:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344164AbiCWTdq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 23 Mar 2022 15:33:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234750AbiCWTdp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 23 Mar 2022 15:33:45 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0571F888FB;
        Wed, 23 Mar 2022 12:32:16 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-2e5e9025c20so29060127b3.7;
        Wed, 23 Mar 2022 12:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=bp+uK2bVKGrYJE9A9yrjStUOUX/hL3b0G+JzfeJzeAA=;
        b=g7uWxNpBnoq8KUtnGbTocfcJNw+WWuzco2I3XLdz+5AI/+mZiWs6TlrzuwsaAoqtQI
         qOqSLhsbETMQO+Qxd1JOlBFAuXj/EFRe/eGvIJB9/MwPzXfjd9ERR234ZJrCOTYjHS7f
         945zlLdcHOY7eWsSLCP+2teoxT+hL+Bd+UbkwCR99Dxeni46FH3zjPVU681xtgg6Fng/
         7kLaZtaT1nTX+/bVUxnMciPh2UhDDL9j7l/j+tDmhBTYF5j0B1IlqdPFNFUV75s6J3oj
         hTIkQGy/ozZ/vgV7nZcWn9GBSl95W1PAV0rruzQ4Efcq9PbgMpsB7ig1joksBTvCn/dn
         umAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=bp+uK2bVKGrYJE9A9yrjStUOUX/hL3b0G+JzfeJzeAA=;
        b=tZKJKlLf7gN7SnLdVg38ZIOnW/ZNh6VTGt9vPJX0DwK406pi14uJ1n+lWG+sxBDQKr
         Lk+d7ISF1Z0BjxXePpoCVgDzdwqmrbfyjIkrMkbCIk8J1s18+Nc0NhfZ6eOy1l1I0Qkv
         T2lRTLKqGhdTmBXmD5fMBIHWHpi86xHVQQwzAuFZvM8eDL3+pPvmmXcy9cxAckXgh6Xf
         zN12Uqe5mPfr/NPPFkhJAju1l6kf25DTW73XD3ZsV3Q1EvRGDSXj39w7T/0utOnYT6fJ
         YtIAnZgUrwcehxoJDhaasvVIK0HdfagG8c5jeJ3jIS53mZkkGnpiFJVYXjJRH+J3jVIL
         P8zw==
X-Gm-Message-State: AOAM533wa9j3QHJLeHUeb6gwVnZQqQ8cs+mlpjtb3C+C4PPCyssNUVNX
        CD5I6Eexg5ZZlrBxhH0umm725FLr55NsmU/fixGxpP3wlH4=
X-Google-Smtp-Source: ABdhPJxJd1loWDK+Bi9PpLn0SOYFDOML6EafynhdJZyxY6pQL8C0dSYNf9mKds0ym109RZXS/Wz1iNguCBdKEh60bWI=
X-Received: by 2002:a0d:dd8f:0:b0:2e5:b961:4098 with SMTP id
 g137-20020a0ddd8f000000b002e5b9614098mr1548884ywe.233.1648063935084; Wed, 23
 Mar 2022 12:32:15 -0700 (PDT)
MIME-Version: 1.0
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Wed, 23 Mar 2022 12:32:04 -0700
Message-ID: <CABBYNZ+D9M2+ehd=2wHc+42kP39xF6GSzcmFVtJm9aSWbfpjdg@mail.gmail.com>
Subject: Issue with HP Elite Presenter Mouse
To:     linux-input@vger.kernel.org
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

Looks like there is a problem with some models which have multiple
reports id, the are registered using UHID, there doesn't seem to be
any errors printed on dmesg but the device doesn't work even though
hid-recorder does show the reports:

https://github.com/bluez/bluez/issues/320#issuecomment-1075038940

-- 
Luiz Augusto von Dentz
