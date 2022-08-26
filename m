Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6194E5A2B6A
	for <lists+linux-input@lfdr.de>; Fri, 26 Aug 2022 17:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344211AbiHZPiX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Aug 2022 11:38:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244390AbiHZPiN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Aug 2022 11:38:13 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8596880E95
        for <linux-input@vger.kernel.org>; Fri, 26 Aug 2022 08:38:01 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id l6so1339898qvu.2
        for <linux-input@vger.kernel.org>; Fri, 26 Aug 2022 08:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=GODOymQfVKwTudlkA1FvLuAELc4tjvpQDgPqt9pSze0=;
        b=R29Xye8I9TOjd6stgYKSXo6LjvmLq/NRnqPbxaGDEj+vzuav+IPlgwp614q4uECRXM
         eL+rIBUni/biGPWGhGybor5vL2YMNt2SQa1tqoiYjWR3iPnKyoraWNKNkmZQrJZn7lYd
         7sQGEzUUd0UCbj7ZhJc4jSgHKU7s/nV5K80wIo9ScZI7T9bTtASm1sx74c31NxBz5GL8
         K4WTNcx/jpbeobhcDRQvfrXF0X1bEOJodVocYjg4m/WzE8jybu0QzECoJHpC45v3e134
         x1r32Y0drN5bFcKh5guqJwTi6t/TMDMtVzkJtIKdGcj+Tfum2CpK5hraStG1u/rM12BW
         65rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=GODOymQfVKwTudlkA1FvLuAELc4tjvpQDgPqt9pSze0=;
        b=ntzIPcSElli9YRRoQh8fLdm1QgEVX4yhoFf14vQn+q4mzwTUgT3vR/LevKXrjfZKAb
         x6rAS3nZmuwLetDG+MfRd2jaVuxZeyTiSdlzllY1l2vjyCXrPui5ThjMqii/WPzfAwgY
         dTvyWr36g0/r5In0OhxJwkyl5dV3ELIjBuc8vLghKMgaDQoE/h34Zdjyk90g25HuPOaV
         ASbxNETW0wR7P2g+DVv/1ejoAI18MScT2i5TKFi8gy7xIxpzksjSNX7bHjvM5pv7muye
         W29qypiZ9r0lpHf2m4fqEfkGqnoA8/DXSpogot59pWii/fawP9oK8Av5XKP+uA6kb/FS
         cpCQ==
X-Gm-Message-State: ACgBeo1OGL0nxIjMy/a1LgFPdnjruc7tHoNicCwEDDQsqd/hDZl9k2YB
        OOTetDDm6s5JQu5HQMiZ/O4=
X-Google-Smtp-Source: AA6agR6fNmI3bfhA/iyY3gKwjWz+Y/DIIxEB23QwGnNm/TIsec7N+fMd5FO32/siPjDUM2k8BYr+kA==
X-Received: by 2002:a0c:b38e:0:b0:496:cbfa:1903 with SMTP id t14-20020a0cb38e000000b00496cbfa1903mr136056qve.83.1661528280426;
        Fri, 26 Aug 2022 08:38:00 -0700 (PDT)
Received: from [192.168.0.27] ([204.237.50.72])
        by smtp.gmail.com with ESMTPSA id x28-20020a05620a0b5c00b006be68f9bdddsm550637qkg.133.2022.08.26.08.37.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 08:37:59 -0700 (PDT)
Message-ID: <a1421662-18ef-dea1-6adb-a18390831aca@gmail.com>
Date:   Fri, 26 Aug 2022 11:37:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] HID: logitech-hidpp: Enable HID++ for all the Logitech
 Bluetooth devices
Content-Language: en-US
To:     Bastien Nocera <hadess@hadess.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Cc:     =?UTF-8?Q?Filipe_La=c3=adns?= <lains@riseup.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
References: <4542beb149883ab5dfdcfd7f6bb4b516e5c1bcdb.camel@hadess.net>
 <CAE7qMrrj+rBzoAFf2FezqexgWNo+iSAd6b5NZwKFQ1C1zD_Qaw@mail.gmail.com>
 <f285873c4cf0a0747db996bbca7e7d9234ce77fb.camel@gmail.com>
 <d3824bda564871c7759fd3b1ebad16b3d9affe1e.camel@hadess.net>
From:   "Peter F. Patel-Schneider" <pfpschneider@gmail.com>
In-Reply-To: <d3824bda564871c7759fd3b1ebad16b3d9affe1e.camel@hadess.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Looking at https://bugzilla.kernel.org/show_bug.cgi?id=215699 reminded me of 
another problem with the driver code.   Several HID++ 2.0 features, including 
the HiRes Wheel, have commands with bit fields in them and set all the bits in 
the bit field at once. But when the driver code sets the high-resolution bit 
for this feature it also sets two other bits, ignoring their current setting.  
This prevents other software from reliably using these two other bits, one of 
which is for reporting wheel movement in the opposite direction, a. k. a. 
natural scrolling.

It would be useful for the driver code to first get the other bits and set 
them to their retrieved values.


peter




