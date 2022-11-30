Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3CA63E1E2
	for <lists+linux-input@lfdr.de>; Wed, 30 Nov 2022 21:25:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbiK3UY6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Nov 2022 15:24:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbiK3UYt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Nov 2022 15:24:49 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9413325F4
        for <linux-input@vger.kernel.org>; Wed, 30 Nov 2022 12:24:48 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id i80so1874500ioa.0
        for <linux-input@vger.kernel.org>; Wed, 30 Nov 2022 12:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sxzUichrAi82VjKkKQWDQ6j9zxGhtCMEiA1yqxp9Fo=;
        b=EjrvDHb/jG7Y+r6I8bistfGoy7Z9Ei+wTxKXPk8GLZU4kRL+LSG9Ac2kdJ6t5HCIZ9
         cx/DvxIdSRUX+Dj51M8NixDsEG5JQTr+YXDGzlznHeX0IIyqSsq4ob/XROWw2SKJF1Kf
         wlI15k4ig5GEdl1Ud5uJgzCQ0KrvsXwDXVLPLBAdgRzroXGl9sAFuarA5vytbxHte5JE
         VsskbuC77F2APeDiGwFxhKg0c62ex0ZszbFHJo4712Fe0iRAeaF2z7EzgVJoPIJBHMNE
         cY2MDJcaF/VES6KeUQc+IChEvvS0XqKpS5JsznAEIbfeneye34dFZZskBqerwxfhWkui
         qv3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2sxzUichrAi82VjKkKQWDQ6j9zxGhtCMEiA1yqxp9Fo=;
        b=ThTPqC17fxBfAkMKJVXO3lc9X5h4cpmz9UtspYP56f+9aS6/uSo9iPqjAucwkRyCRy
         +ay8/wGoYRZoMCwNFnZPBBzEeLlZmBb3zo7xQE5ldxn0iMpEvl7KExO4Ndvj+tY9B7Xk
         IXX3m9NguSuJ3HC4yAUnt/zoPmbZNjmPxOTq67d9/TG3gOZaqz74yx9xVolFNjEWHn/c
         TmRM514GaKENp34onCRa6XJb8C/EEQiAwIpF7kTxt6DSZ06Pb3p6Xh4HODFmo2sjwHl2
         NIro/A5u+HdRE9HUiqIvV3oEZjIxt2iHIQpmnMkZnI7iKIBS2nHUQe/kIScrqwIW8KKX
         WEfg==
X-Gm-Message-State: ANoB5pmBNwGGDisdIuLpDZjXWfCCSSrh/RhnUF13jan3EQ0DcwBN7yFn
        DOwHFZP3oV67s7PoBsuMiE67Ju+fzxI=
X-Google-Smtp-Source: AA0mqf7DpMDcradw4pw4TRycjaYqSyw57nFXV/O+FcW8yfPhbUTE1W7AfqGssXwSTiuaJ/aqNNhkCg==
X-Received: by 2002:a02:a312:0:b0:389:f80a:2cb5 with SMTP id q18-20020a02a312000000b00389f80a2cb5mr3662884jai.40.1669839887775;
        Wed, 30 Nov 2022 12:24:47 -0800 (PST)
Received: from [192.168.0.32] (97-116-62-120.mpls.qwest.net. [97.116.62.120])
        by smtp.gmail.com with ESMTPSA id n7-20020a02a907000000b00389e7fde6fdsm892842jam.116.2022.11.30.12.24.47
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 12:24:47 -0800 (PST)
Message-ID: <61f9fd69-b7c9-6e13-c750-416e6c3f8167@gmail.com>
Date:   Wed, 30 Nov 2022 14:24:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To:     linux-input@vger.kernel.org
From:   "Joshua E. Roybal" <u4ysev@gmail.com>
Subject: psmouse serio1: synaptics: Touchpad model: 1, fw: 8.1, id: 0x1e2b1,
 caps: 0xd00123/0x840300/0x26c00/0x0, board id: 2382, fw id: 1238635
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

[    6.989906] psmouse serio1: synaptics: queried max coordinates: x 
[..5674], y [..4754]
[    7.046093] psmouse serio1: synaptics: queried min coordinates: x 
[1268..], y [1098..]
[    7.048081] psmouse serio1: synaptics: Your touchpad (PNP: DLL0667 
PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi are 
not used, you might want to try setting psmouse.synaptics_intertouch to 
1 and report this to linux-input@vger.kernel.org.
[    7.169633] psmouse serio1: synaptics: Touchpad model: 1, fw: 8.1, 
id: 0x1e2b1, caps: 0xd00123/0x840300/0x26c00/0x0, board id: 2382, fw id: 
1238635

