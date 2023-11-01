Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBB257DE597
	for <lists+linux-input@lfdr.de>; Wed,  1 Nov 2023 18:46:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344602AbjKARqs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Nov 2023 13:46:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344561AbjKARqr (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Nov 2023 13:46:47 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85F48C1
        for <linux-input@vger.kernel.org>; Wed,  1 Nov 2023 10:46:44 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-53db360294fso40092a12.3
        for <linux-input@vger.kernel.org>; Wed, 01 Nov 2023 10:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698860802; x=1699465602; darn=vger.kernel.org;
        h=subject:to:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AJPo3TWAg/Mh6cFAMbuifnRl4Np46wP+7D+lkyUjDdA=;
        b=ZKwbXi+fcl1xrkMYYIh/ecKRaip7uhzzBC7lmPrCiypT1iaf+DpQhwDrL5HGNpXI5k
         9gHfcWR9ImYKRWFTSCtWN9rTfqZlDvI0xFEEHkak4+0HgxUAsQJUty2jL0wsgu2Xw7NB
         IKQKVlb/IdyPclcbnCCWGh+HGv4ogEiaD8cGJdzXkBBTt42BHP0HlQ5mpUB+iaCDK1AO
         /Ee1F5c7+/aoet5U+4QuU3zyPQ08unEBJaOmR3ZpXXps5VM0NAS1J3VKyncj/frLUhg6
         FcKwhNLnJk2gPWM/jo356298fEkwuGKANEKyEW+SYXnBPWA5FKv3GwQENyNCij4h0cm3
         J8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698860802; x=1699465602;
        h=subject:to:from:message-id:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJPo3TWAg/Mh6cFAMbuifnRl4Np46wP+7D+lkyUjDdA=;
        b=B5tKIJwQV69n1kD85QRKK6yHMEvO3haUP9MrSycVD/MMp3wn/GgfPqe21vzT2cLM2M
         yrzKsBXrj8ufvILcQlppOs+UTo4z6vJgBMZTBVO+s81LHc7PrvbpYtvfh8WPELFzHwoJ
         rJSWzaxkrAKlQSF0IKVkrvYHswInxTXWSh+z3Z93WQy1nKfwBPdTNrc8Qnr8IrSjBI74
         kehMoQSnmph3IvhNVxSPCMG2bBbOBTesGXn0l+e29DtJMhX3p7Eps++Ck9qcgAEkHGoy
         Z9CiyJzXBCay2XhBL0V+cDBBAylWcvfF8eBbwNziD6/Lg36xfOUZ5+sKf+WlFaMYMqK1
         esXQ==
X-Gm-Message-State: AOJu0YzlZvNoOuMMxFMJhsPhZ2rOmb5yR38hfmXlrMj5+oBjOAA5oqRF
        2cmubbPI4R6HenqJLMb4V2Fib5MBqufjOC1R
X-Google-Smtp-Source: AGHT+IGlp+Wp7Z98l7hG+LXHyqKTAIpqZx+liv5bL7zV9ScXtXEuseH+rnH5uACJBcOgIfXWJkHUEA==
X-Received: by 2002:aa7:dac2:0:b0:540:4b90:3dc3 with SMTP id x2-20020aa7dac2000000b005404b903dc3mr13085594eds.14.1698860802445;
        Wed, 01 Nov 2023 10:46:42 -0700 (PDT)
Received: from localhost ([151.53.14.115])
        by smtp.gmail.com with ESMTPSA id h20-20020a50cdd4000000b0054358525a5bsm1322748edj.62.2023.11.01.10.46.41
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 10:46:41 -0700 (PDT)
Date:   Wed, 01 Nov 2023 18:46:40 +0100
Message-ID: <cd0bbc5227d1e37c1a4f8f101c359871.giuseppe.bilotta@gmail.com>
From:   Giuseppe Bilotta <giuseppe.bilotta@gmail.com>
To:     linux-input@vger.kernel.org
Subject: Trackpoint and touchpad on Lenovo ThinkPad P15v Gen3 AMD
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        PP_MIME_FAKE_ASCII_TEXT,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

I have recently acquired a Lenovo ThinkPad P15v Gen3
(CPU is an AMD Ryzen 7 PRO 6850H).
I'm running kernel 6.5.8-1 from Debian.
On loading the psmouse module, I get:

psmouse serio1: synaptics: queried max coordinates: x [..5678], y [..4694]
psmouse serio1: synaptics: queried min coordinates: x [1266..], y [1162..]
psmouse serio1: synaptics: Your touchpad (PNP: LEN2161 PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi are not used, you might want to try setting psmouse.synaptics_intertouch to 1 and report this to linux-input@vger.kernel.org.
psmouse serio1: synaptics: Touchpad model: 1, fw: 10.32, id: 0x1e2a1, caps: 0xf014a3/0x940300/0x12e800/0x500000, board id: 3471, fw id: 3972349
psmouse serio1: synaptics: serio: Synaptics pass-through port at isa0060/serio1/input0
psmouse serio2: trackpoint: Elan TrackPoint firmware: 0x12, buttons: 3/3

Of note, if the psmouse module is NOT loaded, I cannot access the trackpoint or touchpad on the machine,
and when loading the psmouse module with the synaptics_intertouch=1 option, I get

psmouse serio1: synaptics: queried max coordinates: x [..5678], y [..4694]
psmouse serio1: synaptics: queried min coordinates: x [1266..], y [1162..]
psmouse serio1: synaptics: Trying to set up SMBus access
psmouse serio1: synaptics: SMbus companion is not ready yet
psmouse serio1: synaptics: Touchpad model: 1, fw: 10.32, id: 0x1e2a1, caps: 0xf014a3/0x940300/0x12e800/0x500000, board id: 3471, fw id: 3972349
psmouse serio1: synaptics: serio: Synaptics pass-through port at isa0060/serio1/input0
psmouse serio3: trackpoint: Elan TrackPoint firmware: 0x12, buttons: 3/3

The mouse seems to work correclty with either option.
(possibly related to the “SMbus companion not ready” message when intertouch is enabled?)
Loading the driver with synaptics_intertouch=0 suppresses the SMbus companion message
(expected, I presume).

Also unloading and reloading the psmouse driver (regardless of the intertouch setting)
increases by one the serio to which the trackpoint is attached,
but I assume this is normal.

Best regards,

Giuseppe Bilotta
