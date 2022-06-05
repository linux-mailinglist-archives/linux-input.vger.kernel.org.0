Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81CED53DC4E
	for <lists+linux-input@lfdr.de>; Sun,  5 Jun 2022 16:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345080AbiFEOnm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 5 Jun 2022 10:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345029AbiFEOnl (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 5 Jun 2022 10:43:41 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 585E1393DD
        for <linux-input@vger.kernel.org>; Sun,  5 Jun 2022 07:43:40 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id x62so15698720ede.10
        for <linux-input@vger.kernel.org>; Sun, 05 Jun 2022 07:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=qqJ9dNFuW/3ZPq5YayY7ywxltCtbPDApiWxgStNncw8=;
        b=JFKy6vgRYNOcQd1CuKY+oTGevMCLdL1xjt0V86c8YHLDQQC7ZbVW1xXS+Ka1Ktof+h
         iH8kiPRlIzkXcIR8GHuyGYJkFd1DafBaXO6kxNTza0/wPSgRwP2YcAn9Q77ZVFnXkpL0
         c5KgfZsLSVTkko8z3d03I2OupsCYopzE8OiZH0Rb+klByrL43sh/Kux2J2ra+O9rlue8
         i+pgAiDtIvyN9IzJR1Otww7vtjFm6RetU/txvEOfAbOEubC9xGCKw+nQ5JsPwwvRiZLp
         Y+iRcEd3bD0nK5wdVHXCZHzeAgJJVSWntd00u6szcEPNjb5vmfw56gw8mNqPsER7KLrH
         dOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=qqJ9dNFuW/3ZPq5YayY7ywxltCtbPDApiWxgStNncw8=;
        b=WBIsMd91STiMtrrsBs1NobjMxl2GVGGuHGAOiUqAEWWIVJE3318wqrTZGdjzlGuwOs
         mSnL0JXANSjvUUjBDhSfEDdgPGdVLZj4Hy8gp984NNrRap0fO851Xys1EqmJ8O03Zlo4
         4SNQVS5UELC7QcQvu8xWmjjR24Y2QkHWeOR9wfAY58WdbjmANThsJML0g/Q2Jv1szqs0
         OvTicwgPsrhR4anyAREE0XpsC6YfgBHGTpr/x6yGWKkQbBoZ0Os454fq/NUROpjnqdAC
         +9QAv+dbDpQUfbbpHCsGppA52FOMysyhARsrZwzR02QQhTau6oZFbo6+jQj6B8xiPRDr
         vK5A==
X-Gm-Message-State: AOAM532RGt6ihYylC+vXQNbz1RUbFunLEoepbDsNKjr0Nd7IOlz9dZDZ
        iOxlDCcgQ11Q+q8YysvOUjvaONVsMvQdUg==
X-Google-Smtp-Source: ABdhPJxvdb8cn2YpU4WmIt2wyM3ydOOhpWoM5Hzla+MyL/lO1xg+RlQvPFSfURDZR7VsKdgj2nFRoQ==
X-Received: by 2002:a05:6402:709:b0:431:3a54:5cbb with SMTP id w9-20020a056402070900b004313a545cbbmr5868039edx.355.1654440218860;
        Sun, 05 Jun 2022 07:43:38 -0700 (PDT)
Received: from [192.168.2.209] ([185.95.176.207])
        by smtp.gmail.com with ESMTPSA id cz20-20020a0564021cb400b0042dd85bd23bsm6895513edb.55.2022.06.05.07.43.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jun 2022 07:43:38 -0700 (PDT)
Message-ID: <a3183abd-5f5b-2508-8b3e-f2c127eafc02@gmail.com>
Date:   Sun, 5 Jun 2022 16:42:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To:     snafu109@gmail.com
Cc:     linux-input@vger.kernel.org
From:   Jaap Aart <jaap.aarts1@gmail.com>
Subject: [BUG] Thinkpad T14 AMD gen1 trackpad doesnt work after hibernation
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,


Sorry if any received a duplicate message, I forgot to send it in text 
form last time.


A while ago I found that after hibernation my trackpad would only 
function half.

While normal clicking and moving the cursor worked, any kind of 
multi-touch is highly unreliable.

Scrolling works sometimes, but selecting text without the extra 
buttons/trackpoint almost never works.


Setting `psmouse.synaptics_intertouch=0` fixes it, indicating this patch:

https://lore.kernel.org/all/20220318113949.32722-1-snafu109@gmail.com/

doesn't work with hibernation.


Jaap Aarts
