Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61E3970A432
	for <lists+linux-input@lfdr.de>; Sat, 20 May 2023 03:15:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbjETBPE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 May 2023 21:15:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjETBPD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 May 2023 21:15:03 -0400
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08A2A1AC
        for <linux-input@vger.kernel.org>; Fri, 19 May 2023 18:15:03 -0700 (PDT)
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-54ff84bdbd8so1122225eaf.0
        for <linux-input@vger.kernel.org>; Fri, 19 May 2023 18:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684545301; x=1687137301;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7cU181GhVhZmOQtTdJU8G70Aag0nVkvCe6Os3IR4UA=;
        b=G6Kstsx6k8nWkoBFVfaeVfVsqJ5MGlWb9ji8eMyPzE2iDffOAlxJKVdmxb6uAdxtf2
         aTDS13NE0fF9Z2EMCNypRRfP46kESdh/YgN6+VyTeShHVXbKAhhxlBaU/AGtlJMxOIeC
         6k/ub7kBFGHr6lfF0kOpoTnZNSf+L7WpBYaTQfuZm/9/DtDLCrxlreeBgaI7EwlZMaSM
         w47o6EX0NbV+xKl+0bdxihsy63vgPr+czWHmee1nOM7gkjoFrUqkdDwhx0QcadPQmmSB
         WUFFfxC3XxUtx3AWFbk1/X/MDny2e9yHJIBBR23mKHwynQ19qyN0xIdxAGzPEvDnHRf+
         l7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684545301; x=1687137301;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p7cU181GhVhZmOQtTdJU8G70Aag0nVkvCe6Os3IR4UA=;
        b=YOLeNHHRusLHuMNMG/H7UZTJCxJmkZea26Z1vR9KWuzt76rY+m6q0iz3x97uTEpV/e
         FnhDuU6udL8F8AhiiU+suIFa/ohiarNKsQmV1gy/QSkmh4q8H7BvBy1Igt1TojUcW0rU
         kaVO3OhAb2wvqpbek+HT7zU20ZgsqYUyxTkcnxlBnV/u/7L6gmdHiEAn1Dv+lqYuFdfa
         jr6O4MTEexOYGUIofb6Ke0H0LMM9koNzXGUY0ywXI61YYVLfxlf+dUMjsvZ4FxZAAzZy
         dPVrGAxATuMO1HaMHzeg8V5e9mk6wPgX+xVO4KvREHP+T8JCQdGcSIPST80DWyCm6v08
         ZxXw==
X-Gm-Message-State: AC+VfDxSalP6sgX5uklZBqnhTrJJw/3YOc8YYPOGsN+XNogWjxVbrWKR
        vZsHue0oltVYHBLJaNEg0d2/5hLonKrMTw==
X-Google-Smtp-Source: ACHHUZ6BABDvec0eL2vGBlnrhLGHNAw8FLteMRK2k6Bd+XvvTSvLVC36La/evwk4O8TBy1qVfxtT/g==
X-Received: by 2002:a4a:6f06:0:b0:547:4f15:6147 with SMTP id h6-20020a4a6f06000000b005474f156147mr1287877ooc.0.1684545301089;
        Fri, 19 May 2023 18:15:01 -0700 (PDT)
Received: from [192.168.1.9] (201-35-78-198.user3p.brasiltelecom.net.br. [201.35.78.198])
        by smtp.gmail.com with ESMTPSA id k28-20020a05680808dc00b00383d9700294sm149901oij.40.2023.05.19.18.14.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 18:15:00 -0700 (PDT)
Message-ID: <9a17e1ba-b36a-feb8-27cf-f4ff063ec275@gmail.com>
Date:   Fri, 19 May 2023 22:14:57 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To:     HID CORE LAYER <linux-input@vger.kernel.org>,
        dmitry.torokhov@gmail.com
From:   Marcos Alano <marcoshalano@gmail.com>
Subject: Approval of patch related to fix to "Xbox" spell in Linux kernel
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

Could we approve, or at least discuss more, these changes Ismael 
submitted last week?

I can't see anything wrong with it, I just think it maybe fell in the 
cracks.

Here is the original discussion: 
https://patchwork.kernel.org/project/linux-input/patch/e864b39b-27e0-c6f2-76e8-db465916f310@gmail.com/

Thanks,
-- 
Marcos Alano
