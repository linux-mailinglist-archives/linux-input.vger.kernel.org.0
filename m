Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 547F72418BF
	for <lists+linux-input@lfdr.de>; Tue, 11 Aug 2020 11:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728372AbgHKJOy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Aug 2020 05:14:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728358AbgHKJOy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Aug 2020 05:14:54 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53C30C06174A
        for <linux-input@vger.kernel.org>; Tue, 11 Aug 2020 02:14:54 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id r11so7265268pfl.11
        for <linux-input@vger.kernel.org>; Tue, 11 Aug 2020 02:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=Q9F9+Rb1CaCq0SUanAE3bPlZu5UOFvtgn0DMfNsZSWA=;
        b=ox3gkoZtIzuaSEHMjt6KTlmULdhixFh9jG32MGrz1ypheXywLl16Bv3LhSF9vkqKa2
         1bzQgx4AIwCWRPvoAYJlZbbi9inLnJqAe6aNipqHzGqbczzIrq8e1LvmEOJiqZLmT3Bd
         GHCH/GUyV4/DT7HBsOc7MAUGwAlW/NQBtqQ0xXt5jvi6LmenYCsnCEXkI1UYWnZdR4KG
         h5bT7Vy3pKE+sqAMfIwT7BgmtH8F6NJ28HWePVKqcbAhyPB8tGhwXOuQ7RoT4E8AOKl+
         aM/btmnr3ZCKGoAzE5+tKOCCnWTKxOpV4sMQ/KkQ1FODvQk180WnX1iGbEkojtRNN8Ra
         7XqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=Q9F9+Rb1CaCq0SUanAE3bPlZu5UOFvtgn0DMfNsZSWA=;
        b=n1MDMFkh8SbGFRMmXl3zXYXl+kDSPGdNKT2yYvSgTskshDNlr3gBoyaze849RJvIdN
         nXws5QXsPmwilzfdTiQsc5Qgp1ZfGDwrtc97gSVh7GSgctVe6AFUsco4XlwqUPn7C47b
         zsgxoMJn7Bu2pydGdu4PGzz8KppYCJVqSi/KGHOGAJt1uBKsKjfa9yA+hL1RmXsPVUyR
         Leez0BYc13KU425fGUZzErPnkjJMwdnw6E9PKbq/Jn+Ih9LmokHfHfkYD5Byjxy5Mx/k
         jd0rFiH4qdgvrpGqWnpJ+10pOAi1SYq0VU+PqvWnmuoR4E2Y8Gg2XFzZFLeRqmKJ23wm
         DUVQ==
X-Gm-Message-State: AOAM531yi+8d41KunaPrQNtvsyK77LNbMWX62WKn47g1loBkyb11aA0s
        EcicdMf5mYtwADl4etj7MnDZCNC154YajA==
X-Google-Smtp-Source: ABdhPJwfu6T8OJjO5efjguESbBGEqhczsOHXcDkrpKMwge0Ozv65vI1sgHYrAxaB8YicOrTbfwlRsg==
X-Received: by 2002:a63:220a:: with SMTP id i10mr82838pgi.88.1597137293410;
        Tue, 11 Aug 2020 02:14:53 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id d81sm25096483pfd.174.2020.08.11.02.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 02:14:52 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date:   Tue, 11 Aug 2020 17:14:45 +0800
To:     linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Advice on fixing the bug of MSFT0001:00 04F3:Touchpad being handled
 by hid_multitouch by mistake
Message-ID: <20200811091445.erp2b23xmx3ceyzp@Rk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

I'm working on a touchpad device issue as reported on
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1887190.

This touchpad device MSFT0001:00 04F3:Touchpad should be handled by
hid_rmi. But currently hid-core.c chooses hid_multitouch by mistake,

     1. When scanning this device's report descriptor, HID_DG_CONTACTID
        usage is found. Thus group HID_GROUP_MULTITOUCH is assigned to
        the device.
     2. The flag HID_SCAN_FLAG_MT_WIN_8 is also found. Thus group
        HID_GROUP_MULTITOUCH_WIN_8 is assigned to the device.
     3. hid-multitouch.c claims handling devices with the group of
        HID_GROUP_MULTITOUCH_WIN_8

         static const struct hid_device_id mt_devices[] = {
	        /* Generic MT device */
	        { HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH, HID_ANY_ID, HID_ANY_ID) },

	        /* Generic Win 8 certified MT device */
	        {  .driver_data = MT_CLS_WIN_8,
		        HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH_WIN_8,
			        HID_ANY_ID, HID_ANY_ID) },
	        { }
         };

There are several potential solutions,
     - Let the device vendor fix this problem since this device's report
       descriptor shouldn't have the HID_DG_CONTACTID usage.
     - Make it a special case by setting the device's group to
       HID_GROUP_RMI in hid_scan_report when vendor id and product ID
       are matched.
     - hid-quirks.c seems to be designed to handle special cases, is it
       suitable for this case?

Can anyone give an advice on which direction I should take? Thank you!

--
Best regards,
Coiby
