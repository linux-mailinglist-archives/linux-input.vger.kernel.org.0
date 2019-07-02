Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DEBE5D535
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2019 19:26:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbfGBR0d (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Jul 2019 13:26:33 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33205 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbfGBR0c (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Jul 2019 13:26:32 -0400
Received: by mail-wr1-f65.google.com with SMTP id n9so18810838wru.0;
        Tue, 02 Jul 2019 10:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GJQWdYjGRJbWGQyVM/pVQ8ZoWrqzt0Iwb6wDU6NZk2g=;
        b=O+tny0zmZLUocyLGuzn577ZQeQVqyE3IVzVoF5ClP1sMNqM3CmWSRE4DR3QvA1BGmv
         0LEmxDnJYQ/+nLk/aCAR8MsPwAleyo06XvyhWiyAh77rTCWL1ObF9kSyoxvCty4/GrOb
         rLeINNDhVgwvCSw05cv+UnLNJZtJbxZxpCdx+ufK8prvVHLS+pmEad6ykSmqLtl3Vw/f
         iDx5tMCkb1sA5CzLkn/5p4xHRx6DXSo++Gvnn0ranBCmUKuonBGE76kU/ozvhLmhw7uc
         mSR5SbuMLIAoddU3Zk6+CyxAUuqaRdpsDoYN8HUyIK9AnRnqxJo17rD5BDb9/tIhdLyZ
         wQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GJQWdYjGRJbWGQyVM/pVQ8ZoWrqzt0Iwb6wDU6NZk2g=;
        b=PbR1O0Q5TcHYwQYf9T0exynGm7TCviZlMMNJjdhzBdZVAXcLb4wphEO+dj15Hbtd8v
         a/4Q3ELttbs+foxuVflJi31GQwJEpjVSLW0SFVrZldd7AkoFP+EapUD7vxk7bHG/MJdf
         30mUJn2wZOJcqHkQgpkySmHEpmA8PA944ajRC1FqnYQrqbud69xtJVYhwubCfdCT3Z9v
         AZmvzelRKyORTaO/ISbfyYzP4NUyX2dryTUbnWFbp3Q/GpeWbuIgMatQqzmd6xXvJ2OF
         S+brZrTEUY0IdfUyFWzhakK7Ezr21OZ29WbILhOoQBeyif9iBHSQq+IJALIpRrvPYhwV
         kLEw==
X-Gm-Message-State: APjAAAWM+1SwCzwt2WrVQswU54/b8y1E+YW0b0Rl1i22CwcmQkCoV4uF
        Ca3WeXRRMMD6e6UeEmIRw/A=
X-Google-Smtp-Source: APXvYqxJuQ0kjRWoYunRRlB7QJFYv0FpgfdFcDJ22PBoD8/5tt472sT0BHd+Y3eG4bgBajESQWs2iQ==
X-Received: by 2002:adf:de8e:: with SMTP id w14mr26028921wrl.130.1562088390364;
        Tue, 02 Jul 2019 10:26:30 -0700 (PDT)
Received: from [192.168.2.202] (pD9E5A169.dip0.t-ipconnect.de. [217.229.161.105])
        by smtp.gmail.com with ESMTPSA id p26sm18738909wrp.58.2019.07.02.10.26.28
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 10:26:29 -0700 (PDT)
Subject: Re: [PATCH 0/2] Support for buttons on newer MS Surface devices
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Chen Yu <yu.c.chen@intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <20190702003740.75970-1-luzmaximilian@gmail.com>
 <CAHp75Ve-f-piRxwG2u2djWGt2fUKkvZSDJ+XkjGKLmMZeLEYsw@mail.gmail.com>
From:   Maximilian Luz <luzmaximilian@gmail.com>
Message-ID: <c50dbd58-c0d4-1a93-b292-68df209749b9@gmail.com>
Date:   Tue, 2 Jul 2019 19:26:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAHp75Ve-f-piRxwG2u2djWGt2fUKkvZSDJ+XkjGKLmMZeLEYsw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 7/2/19 7:13 PM, Andy Shevchenko wrote:
> I re-pushed to my queue, though if you are going to send a new
> version, check my repository for the titles of the patches (you need
> to use correct templates for the subsystems).

Got it, sorry for the inconvenience.

Thank you!
Maximilian
