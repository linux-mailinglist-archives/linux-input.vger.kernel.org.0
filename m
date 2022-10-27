Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED7B560F242
	for <lists+linux-input@lfdr.de>; Thu, 27 Oct 2022 10:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235010AbiJ0IX0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Oct 2022 04:23:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235015AbiJ0IXQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Oct 2022 04:23:16 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0E9C16DC04
        for <linux-input@vger.kernel.org>; Thu, 27 Oct 2022 01:22:58 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id a14so909400wru.5
        for <linux-input@vger.kernel.org>; Thu, 27 Oct 2022 01:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5NPJEGh4aMl2EUCRtS3xlPrlFad2zmsg54XbEo+X3A=;
        b=ipBVkQBdqowby9lD3BfiQrJv/41FWbfnQCdin2yBRxAHzycdRjseUJ+N6y1/cd3wDd
         qyBBoTM3YJlpsMLvjMnrVEEgb6CU7kombbamZBRGlgjOtQkQ2dvnDClCTnKo4KQ2nFbI
         6mwiVu3Wy3PBlarxKFaWhyMyr0ZsOuR2gcU/EngYuj7mLYbEmADU4hu0X2CLZrjyxGvk
         uHQ9S6bjn+Bzkjn9a+Xq+bJeZ39U6XcsXvwJR5ofkcXUSML2Ontby/Bu3EcYpZDaR8t2
         tW2qWwz0LAcXxMopOZZXSi0afE3XeaAGVM+fbT9TyqnTKRuknSxYaMt/7FhQruom0CFK
         Ka/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d5NPJEGh4aMl2EUCRtS3xlPrlFad2zmsg54XbEo+X3A=;
        b=g8LAH1AWtTAFb8HKhqCCElOOnxIH6OBHzoHaRC9smH4HUd0xk9n+qtBvjgcP+YEAj+
         V1iQ4i+dYGMpC2PuKjH/5cr9OFKLtViaS/YU6E7PW4jbdlPRLgMt4G7AlMA2NutsVEHE
         3FH7AXc8bZ27zdxx3G4vQ6Mdfghgh41d9/5582RmVgh2veIkeZ8/aUJhxaHeVnI96chc
         pGVsf1chlDyjlpBJRRK/LI2Q/RWiDfAiQvtbaPtQjarSI81AaoLTIGsDdSdWK+eMsU5c
         1FR4A9z2nm7RJlW75ZaMayQSiVFrfVptO0QqZPC0hjddOVxlx11uQQpm36cOJWuhpL/I
         IgEw==
X-Gm-Message-State: ACrzQf2K4bMDbwxpiHbKWY4sm+6F5uhTE/f5jx4sN9ihqHPTqIuelcHV
        lwa2J26rmw2dvmOn8Jvmjnwbemd7Mm0=
X-Google-Smtp-Source: AMsMyM6bOmvBLfEUnX55wM/gzNAVNjBo5iriD3brmKNif4F6eA3K0qFHXaVNHky+YFYsd6mIenLdag==
X-Received: by 2002:a05:6000:144c:b0:230:816f:3167 with SMTP id v12-20020a056000144c00b00230816f3167mr30990254wrx.532.1666858977076;
        Thu, 27 Oct 2022 01:22:57 -0700 (PDT)
Received: from ?IPV6:2001:b07:a2a:1391:ef2c:d6fd:69f3:d0fb? ([2001:b07:a2a:1391:ef2c:d6fd:69f3:d0fb])
        by smtp.gmail.com with ESMTPSA id q17-20020adff791000000b0023655e51c14sm543138wrp.32.2022.10.27.01.22.56
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 01:22:56 -0700 (PDT)
Message-ID: <d5111100-2594-c8d2-affc-34f81b1e23ea@gmail.com>
Date:   Thu, 27 Oct 2022 10:22:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To:     linux-input@vger.kernel.org
From:   Matteo Lucarelli <mt.lucarelli@gmail.com>
Subject: synaptics needs psmouse.synaptics_intertouch to 1
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

uname -a
Linux ml-HP-ProBook-470-G4 5.15.0-52-generic #58-Ubuntu SMP Thu Oct 13 
08:03:55 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux

dmesg:

[    4.761769] psmouse serio3: synaptics: queried max coordinates: x 
[..5636], y [..4702]
[    4.769371] sd 2:0:0:0: [sdb] Attached SCSI disk
[    4.785179] usb 1-7: new full-speed USB device number 3 using xhci_hcd
[    4.795931] psmouse serio3: synaptics: queried min coordinates: x 
[1304..], y [1150..]
[    4.795968] psmouse serio3: synaptics: Your touchpad (PNP: SYN304a 
SYN0100 SYN0002 PNP0f13) says it can support a different bus. If i2c-hid 
and hid-rmi are not used, you might want to try setting 
psmouse.synaptics_intertouch to 1 and report this to 
linux-input@vger.kernel.org.

/proc/bus/input/devices:

I: Bus=001d Vendor=06cb Product=0000 Version=0000
N: Name="Synaptics TM3246-001"
P: Phys=rmi4-01/input0
S: Sysfs=/devices/rmi4-01/input/input58
U: Uniq=
H: Handlers=mouse0 event4
B: PROP=5
B: EV=b
B: KEY=e520 10000 0 0 0 0
B: ABS=6f3800001000003

fixed by setting psmouse.synaptics_intertouch to 1 as suggested





