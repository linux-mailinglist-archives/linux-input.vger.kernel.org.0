Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 756F11FD79F
	for <lists+linux-input@lfdr.de>; Wed, 17 Jun 2020 23:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbgFQVkB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Jun 2020 17:40:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726991AbgFQVkA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Jun 2020 17:40:00 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB434C06174E
        for <linux-input@vger.kernel.org>; Wed, 17 Jun 2020 14:40:00 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id r11so2311554vsj.5
        for <linux-input@vger.kernel.org>; Wed, 17 Jun 2020 14:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=QDaudtPwtmfREKhspJpoODAc8hcdlZZQZu/u2o7xZmw=;
        b=KM94zZSKGTrITovSBIa4ZRZnukgxLFrgIa81yYJ42axUO5dmVFm1zYfYkqBmqFtsF4
         o9RrpsZeeUfLN4UOEOKJgJUSgMkLImCqLl7szJ1JpRbfOMze/ud9DdvtkofRPijlczE3
         DdD4SGakpefIYlfwtqxPR0Pzygz/ObuRhd7PQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=QDaudtPwtmfREKhspJpoODAc8hcdlZZQZu/u2o7xZmw=;
        b=VTc0Yk1sizkzavePzimSgUCnDa0qTxi21iyNIOTBpcX1kfD2QJooRCI2OiCLrAsCAI
         fZbHLXpmtXcIE4t41XXFaobjt3Hga39GIQ1pN4fKUJJcFCGUW56/OAMBIGUZVHUJlIPu
         B1B47JO5GTwEXoSX3kpxT4jeYrf9VaG2S9OVqZlITCPPpBKsOwPmzP7TDl95MX3FPECq
         LgweT/o6r38EY5dloPmEn59c0uOl2rJs77GXUCqW2jdzLw/SdOI7nFMQzkZDDelFrh/w
         ojqmEUllpMfwiLK75TgyMeyg8VKmf9ty/3ndeaFeXSflH8LHL2KxCTuAcSErU6w8q8W3
         VBMA==
X-Gm-Message-State: AOAM532CKR/LRgcTJYkVz9efZyBL2F8LacrWiRy73V8POnHWxnBia1rr
        CxlVHO72IBY30lccNsDYt1OYzKiATEg=
X-Google-Smtp-Source: ABdhPJzUaszXRNrbrkfNX07Bp6JluVvhhX0zxa1/1nJJOXiCAqfrOlUyMrMyi4nQE49GHUPxKLrycA==
X-Received: by 2002:a67:cb87:: with SMTP id h7mr1100762vsl.226.1592429999410;
        Wed, 17 Jun 2020 14:39:59 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id n12sm91213uap.8.2020.06.17.14.39.58
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2020 14:39:58 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id q10so938510vka.4
        for <linux-input@vger.kernel.org>; Wed, 17 Jun 2020 14:39:58 -0700 (PDT)
X-Received: by 2002:a1f:5cd0:: with SMTP id q199mr1281409vkb.34.1592429998021;
 Wed, 17 Jun 2020 14:39:58 -0700 (PDT)
MIME-Version: 1.0
From:   Harry Cutts <hcutts@chromium.org>
Date:   Wed, 17 Jun 2020 14:39:47 -0700
X-Gmail-Original-Message-ID: <CA+jURctks30toWAipy-ozvwrh1CsQzZHgAuNRPHdrDY2woufMA@mail.gmail.com>
Message-ID: <CA+jURctks30toWAipy-ozvwrh1CsQzZHgAuNRPHdrDY2woufMA@mail.gmail.com>
Subject: Graphics tablets getting INPUT_PROP_DIRECT incorrectly
To:     linux-input <linux-input@vger.kernel.org>
Cc:     spang@chromium.org, Kenneth Albanowski <kenalba@google.com>,
        Jacques Pienaar <jpienaar@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Kernel input people,

On Chrome OS, we've observed a couple of graphics tablets getting
INPUT_PROP_DIRECT set despite them being traditional digitizers
without screens. The two tablets we've seen this for are the Huion
H610PRO (VID:PID 256c:006d) and the UGTABLET 10 inch PenTablet
(28bd:0905). Reverting "HID: input: Set INPUT_PROP_-property for
HID_UP_DIGITIZERS" (8473a93d1ba5385f63a128a285702ccc1d3ae2cc) fixes
the Huinon, at least. (We didn't get a chance to test it with the
UGTABLET.) Do we know if this is a shortcoming of that patch, are
those tablets just describing themselves incorrectly in their HID
descriptors? (in which case I guess we'd just have to add quirks for
them)

Thanks,

Harry Cutts
Chrome OS Touch/Input team
