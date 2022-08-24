Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B994F59F376
	for <lists+linux-input@lfdr.de>; Wed, 24 Aug 2022 08:11:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234856AbiHXGL3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Aug 2022 02:11:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234921AbiHXGLS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Aug 2022 02:11:18 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3B1024096
        for <linux-input@vger.kernel.org>; Tue, 23 Aug 2022 23:11:15 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id u24so9863189lji.0
        for <linux-input@vger.kernel.org>; Tue, 23 Aug 2022 23:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=0s4ntNQsUIQn/kFyYIYmGt0d+4SBjZpA50bjbJP5j44=;
        b=b2a6jcFod6gK8kF8BJGn6z73zxuHv6vGvS1QofeXTGXivNxAoMqF21VG4qWho0vui8
         F6npG3/jAQd6T+O3jJfRAMBPksYlQYEHuyfQyO/s1rSN4KvwQykKgz/O1jYMCUkiJRlD
         4GeQ6/Y8+f4dDX43PzBpvmau6U9CE0RcLF7w0kV/PhOuU68qGnEYSuv2Q2hOpfn4/lKF
         xN7lXQYWPVLce+tzvNjiXEwWGx0kUregmXu7Uq2DVFs39qkAml8IpUE+DReewRNnsLlv
         K23UcY51i3NPTo1UlGSm9NzLScLesmuw8G6O1tiwLhaRg0AeCZSWRQhKReYOXJSpPVma
         auDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=0s4ntNQsUIQn/kFyYIYmGt0d+4SBjZpA50bjbJP5j44=;
        b=IaVGoWLYJ5mpLFTldviuTMGIhD2u21X/iAOc7qoGjNpthhARpUP19NbTXLNntiNOdx
         GTbQpO9QqIXvLl2rpiHMNWDR0FXAKo9BGi9qAsMHZCs457Ko0/vMQ1xTPv2KRi4H0C0n
         +rwhiMlFbCLzARx3vPpy7zXEzSFoyOY3aNUGVvBjC1HAkvpGC3jxfgUFou7oeZzDdyGr
         /yWp7Nm2GPDLl995ZFcjPDcrcmp2L5sq/tU0EJ8hhdPu4bvfOUIAei9+S28vsXptBlfj
         Jqv/Wa2QxmUcxH6x/ZQ/rra+eLc0eRi9TSgJfcN5C/myKcd2wtpEnXIDpepQ2u1QmxGT
         qoDA==
X-Gm-Message-State: ACgBeo1ia7yAf+EjGgWA3Wa+oBnw2KoU/k+ulqw2uXSgDWoHYSvlGfmX
        ISSw5BGFu2KpNavDWZAX7nFzX8HcTxXhQQ==
X-Google-Smtp-Source: AA6agR5HDIIq9CGCS2IlqbjXxpgVNZlmHhZQ0rAHCpt0MvFi/clGA8LN/QjUFvpaR/3AaRzpkg/qPQ==
X-Received: by 2002:a2e:b0e7:0:b0:261:d8fa:c23f with SMTP id h7-20020a2eb0e7000000b00261d8fac23fmr1323485ljl.444.1661321473416;
        Tue, 23 Aug 2022 23:11:13 -0700 (PDT)
Received: from abyss.localnet (2a01-115f-4107-5400-bd98-c56e-a036-7979.fa.ipv6.supernova.orange.pl. [2a01:115f:4107:5400:bd98:c56e:a036:7979])
        by smtp.gmail.com with ESMTPSA id a2-20020a05651c030200b002619257da21sm2661164ljp.118.2022.08.23.23.11.12
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 23:11:12 -0700 (PDT)
From:   Grzegorz =?utf-8?B?QWxpYm/FvGVr?= <grzegorz.alibozek@gmail.com>
To:     linux-input@vger.kernel.org
Subject: touchpad PNP: LEN2072 PNP0f13
Date:   Wed, 24 Aug 2022 08:11:11 +0200
Message-ID: <12081544.O9o76ZdvQC@abyss>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi, I'm using a Lenovo T14 gen2i and I can see it in log:

sie 21 22:59:00 kernel: psmouse serio1: synaptics: queried max coordinates: x 
[..5678], y [..4694]
sie 21 22:59:00 kernel: psmouse serio1: synaptics: queried min coordinates: x 
[1266..], y [1162..]
sie 21 22:59:00 kernel: psmouse serio1: synaptics: Your touchpad (PNP: LEN2072 
PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi are not 
used, you might want to try setting psmouse.synaptics_intertouch to 1 and 
report this to linux-input@vger.kernel.org.
sie 21 22:59:00 kernel: psmouse serio1: synaptics: Touchpad model: 1, fw: 
10.32, id: 0x1e2a1, caps: 0xf01ea3/0x940300/0x12e800/0x500000, board id: 3471, 
fw id: 3584089
sie 21 22:59:00 kernel: psmouse serio1: synaptics: serio: Synaptics pass-
through port at isa0060/serio1/input0
sie 21 22:59:01 kernel: psmouse serio2: trackpoint: Elan TrackPoint firmware: 
0x11, buttons: 3/3
sie 22 07:48:14 kernel:  ee1004 iTCO_vendor_support intel_powerclamp mtd 
snd_pcm_dmaengine mac80211 snd_hda_intel think_lmi kvm_intel 
firmware_attributes_class wmi_bmof intel_rapl_msr mei_pxp mei_hdcp libarc4 
snd_intel_dspcfg kvm snd_intel_sdw_acpi irqbypass snd_hda_codec overlay 
uvcvideo intel_cstate iwlwifi snd_hda_core videobuf2_vmalloc btusb 
videobuf2_memops intel_uncore snd_hwdep pcspkr psmouse i2c_i801 btrtl 
videobuf2_v4l2 spi_intel_pci iwlmei e1000e snd_pcm spi_intel i2c_smbus 
videobuf2_common btbcm mhi_pci_generic snd_timer cfg80211 mhi videodev btintel 
thinkpad_acpi btmtk ucsi_acpi ledtrig_audio mc platform_profile bluetooth qrtr 
typec_ucsi snd ecdh_generic typec rfkill roles coretemp soundcore 
int3403_thermal wmi vfat fat processor_thermal_device_pci_legacy 
processor_thermal_device processor_thermal_rfim processor_thermal_mbox 
int3400_thermal acpi_thermal_rel processor_thermal_rapl intel_hid mei_me 
intel_rapl_common sparse_keymap mac_hid mei acpi_tad thunderbolt 
int340x_thermal_zone
sie 22 07:48:14 kernel:  ee1004 iTCO_vendor_support intel_powerclamp mtd 
snd_pcm_dmaengine mac80211 snd_hda_intel think_lmi kvm_intel 
firmware_attributes_class wmi_bmof intel_rapl_msr mei_pxp mei_hdcp libarc4 
snd_intel_dspcfg kvm snd_intel_sdw_acpi irqbypass snd_hda_codec overlay 
uvcvideo intel_cstate iwlwifi snd_hda_core videobuf2_vmalloc btusb 
videobuf2_memops intel_uncore snd_hwdep pcspkr psmouse i2c_i801 btrtl 
videobuf2_v4l2 spi_intel_pci iwlmei e1000e snd_pcm spi_intel i2c_smbus 
videobuf2_common btbcm mhi_pci_generic snd_timer cfg80211 mhi videodev btintel 
thinkpad_acpi btmtk ucsi_acpi ledtrig_audio mc platform_profile bluetooth qrtr 
typec_ucsi snd ecdh_generic typec rfkill roles coretemp soundcore 
int3403_thermal wmi vfat fat processor_thermal_device_pci_legacy 
processor_thermal_device processor_thermal_rfim processor_thermal_mbox 
int3400_thermal acpi_thermal_rel processor_thermal_rapl intel_hid mei_me 
intel_rapl_common sparse_keymap mac_hid mei acpi_tad thunderbolt 
int340x_thermal_zone
sie 22 07:48:14 kernel: psmouse serio1: synaptics: queried max coordinates: x 
[..5678], y [..4694]
sie 22 07:48:14 kernel: psmouse serio1: synaptics: queried min coordinates: x 
[1266..], y [1162..]
sie 22 20:41:22 kernel: psmouse serio1: synaptics: queried max coordinates: x 
[..5678], y [..4694]
sie 22 20:41:22 kernel: psmouse serio1: synaptics: queried min coordinates: x 
[1266..], y [1162..]


