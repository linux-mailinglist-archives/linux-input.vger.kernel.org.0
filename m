Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B27E71A0FCB
	for <lists+linux-input@lfdr.de>; Tue,  7 Apr 2020 17:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729072AbgDGPAd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Apr 2020 11:00:33 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45372 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729064AbgDGPAd (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Apr 2020 11:00:33 -0400
Received: by mail-lj1-f195.google.com with SMTP id t17so4033188ljc.12;
        Tue, 07 Apr 2020 08:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=n9qgnK2KRBH7r2dzJsAycd35bPm5nSXjOlpxrB9QcgM=;
        b=DnUBQwpLF1yGSi2kCfjTckSu3hVQIAqPRf6DCY6DKO1++HLkqNzgAjG/AOk4unY1sr
         A/yLSMR7xjVELDvtTH34sD3slYnF0yY/RPfzExQH+W6QU3iNJ9VjsxpoBFOXQixtHP6c
         /5AmVZSXEX3S5Px2atvu92qQLIx9LmEmBBiqAowyhAfXA2szGkqoYtB0nIF24JEBVQ1b
         Ng+s6Yvhhk6TgT8yV6vjRFliE8nJrofXIVu1xlT1HHvQp4leEOYSateJojFu5ze5Uj4+
         jXZO7sEKsJzLI+krVprqAFYNIR4CL75T9ZNEDrTj87TkkRD/tgxNuoGXgN20kDqD0Zsp
         Rejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=n9qgnK2KRBH7r2dzJsAycd35bPm5nSXjOlpxrB9QcgM=;
        b=poQJ3OIi3hIiq1zWdj2s6rj6+wLnlEga4SZy6WNShfQuFeN5wVJj51QAbAUxbTibPx
         faI2s5YjqKUCt7gVGQQMb2RSKN38mnessZ+Edq+5Uq9iLQjSqQosWFsEKwDVVL5cOJwa
         EmgVu64/r344Uustpube11JFsyuL5z1CO02aImhlsWsE7xPSIolJfUqg7WFI6ijkont0
         4GfstSRKZgFDonns42zDSKPuRa0ygbW3yeuKOIW6POlDj2tLp2Zwl7LZap40L0AwMPG3
         D65a9vw19cqqXFg47zF+MZgeoHJthczVuF9Q3Q96eHC+ae+J2teUFgCUe5+Itnvgpdba
         nMBQ==
X-Gm-Message-State: AGi0PuYzSq50FbLlVtDgMgK/usnPNU9X5QNeVi8zNDkYkDsLl9Mk0Hat
        bwAPvYrMTLO3QCbFmcfSygGq3Kk4
X-Google-Smtp-Source: APiQypKiJGQiLiQA48VDa3JP3jGkXKo3FZCYfQFwllaqzQw15HCQQysW6YJAqfQxTNyNx+zXA5et/A==
X-Received: by 2002:a2e:6809:: with SMTP id c9mr1974279lja.251.1586271631199;
        Tue, 07 Apr 2020 08:00:31 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id x24sm4014932lfc.6.2020.04.07.08.00.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2020 08:00:30 -0700 (PDT)
Subject: Re: [PATCH v10 54/55] Input: atmel_mxt_ts: Implement synchronization
 during various operation
To:     "Wang, Jiada" <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bsz@semihalf.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200331105051.58896-1-jiada_wang@mentor.com>
 <20200331105051.58896-55-jiada_wang@mentor.com>
 <c53637ef-8e5d-3243-7236-5da360021f21@gmail.com>
 <b06c7915-562f-ec68-766a-2118cfe57a0f@mentor.com>
 <b9a8865c-7754-16f7-8f66-9cd70dc42d3c@gmail.com>
 <c5e7dc2d-08c7-e55e-352d-b9b0d86fe63e@gmail.com>
 <500c814a-b0f4-db9f-30f6-bc6ac985c5e2@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b429ec7f-3cea-d689-aecd-ae2abe12420a@gmail.com>
Date:   Tue, 7 Apr 2020 18:00:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <500c814a-b0f4-db9f-30f6-bc6ac985c5e2@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

06.04.2020 07:18, Wang, Jiada пишет:
...
> I had some test,
> and confirmed you are right,
> this commit is no longer applicable to upstream,
> but as discussed in another patch,
> disable_irq() need to be moved after remove of mxt_fw_attr_group.
> I will add this change in a new commit.

Sounds good.
