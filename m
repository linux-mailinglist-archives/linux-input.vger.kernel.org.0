Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2345299408
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2019 14:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732359AbfHVMmQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Aug 2019 08:42:16 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42]:52252 "EHLO
        mail-wm1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732129AbfHVMmQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Aug 2019 08:42:16 -0400
Received: by mail-wm1-f42.google.com with SMTP id o4so5499399wmh.2
        for <linux-input@vger.kernel.org>; Thu, 22 Aug 2019 05:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=NLEUkhyas12+K+dGeLHSrY3OmEuz5EYl3tuZ1zgI3Vk=;
        b=NM8oJzFmXpAUNUXY9rrbt7vViNOTIjBVmjd7bup7b9Nk2u/pgqoZJt34zc4++apCcQ
         5H5Y5kIbd0TEwQTSdX13wY6PJUy0yDvkGfKu4/9adDdFCe6+twdghluF3mO0VFpsJ09P
         UPXF0hHVFXr+9ccbwgyZ57Kv3bECVaj0b8Cltwtc9zAIHLgQEZPbnSDdjmGwPIIa/TWS
         hoDwNJSG/gFAaXVLFg7eBjPDie0wlUnIqls+My7afwt7QuraKVfdvHJ70M00g6pqyADq
         ywPZOuH4srdq169ZxHM29V21mkJ4XJrshwxCOzj1LACqsUCuc4wDA6tRP+azZTtpknYv
         9j6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=NLEUkhyas12+K+dGeLHSrY3OmEuz5EYl3tuZ1zgI3Vk=;
        b=oPCvuMxxOKn+XffpNod5fp+S9Uy3iwXxh6f/ykWGTcv5I4rFwXvA0RdgNCH2+GF7ir
         7Ae60gij42R8+ypxYmdI6ZSpwpx/scdxgW4t+E69xTmW1/jxfVwhCo0vBy4SP9TtUWfJ
         LdVgAgDO0i7N01k9aRJbteAM5BdW9EbYfETEPKpy6NKrxGj6K4V3WmcjeaNo28O0Egpj
         gwER/U5gX8pUSOFrxC5XoUFhMAMUSKYQzeeiGHXF/XEF+upAqUaPMSO2niRTqPgyrxVq
         kM9cUWgYP7ZA+TGG06QUz9v/04o0pVc5yztJfCqMd6smJNHmgJ55694+CbBcuK9c5wVj
         HiHg==
X-Gm-Message-State: APjAAAXubEMHnpb2v02krRjLw7BQpDQo7P27DpQ3dtaKcVNXInMKl6wm
        cyDBm/sXmEosxOEAcfZyEhLUKMP5
X-Google-Smtp-Source: APXvYqwIZn4qLR6Ec8SDz8h6qlkhfSDI1RpqO8lSY8JnDLQpPw2IDKzxTw3ffu/q87txv8qEA10cBw==
X-Received: by 2002:a05:600c:206:: with SMTP id 6mr6161271wmi.91.1566477734052;
        Thu, 22 Aug 2019 05:42:14 -0700 (PDT)
Received: from [192.168.10.10] (static-74-10-229-77.ipcom.comunitel.net. [77.229.10.74])
        by smtp.gmail.com with ESMTPSA id o129sm8525722wmb.41.2019.08.22.05.42.13
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2019 05:42:13 -0700 (PDT)
To:     linux-input@vger.kernel.org
From:   Bernat <bernat.arlandis@gmail.com>
Subject: What happened to ff-memless-next?
Message-ID: <42eb124e-5b8c-9817-b8c2-c11d82958c08@gmail.com>
Date:   Thu, 22 Aug 2019 14:42:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: roa-ES-val
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi.

I own a Logitech G29 driving wheel and have discovered that FFB effects 
are not implemented while on the G920 driving wheel they are working. If 
I've understood correctly this difference is related to the handling of 
FFB effects by the device. The former device needs the FFB commands that 
make an effect to be sent in realtime while the latter can be 
programmed. Is this right? Anyway, on other OSs these devices are 
considered feature equivalent and work pressumably the same.

I've been trying to track work on the Logitech driver to implement these 
effects: https://lwn.net/Articles/595619/

It seems Michal Malý put a lot of work into this already. I don't know 
what happened to these patches. Why didn't they never get integrated?

I'd like to know if there's something that can be done to make some 
progress. There's a group of enthusiasts that would like to see this 
implemented.

Thanks.

-- 
Bernat Arlandis

