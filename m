Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A53D41895
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2019 01:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391655AbfFKXGl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Jun 2019 19:06:41 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47]:52926 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390115AbfFKXGl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Jun 2019 19:06:41 -0400
Received: by mail-wm1-f47.google.com with SMTP id s3so4611230wms.2;
        Tue, 11 Jun 2019 16:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:cc:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=a2xmmeRndxEnZa1295uuokWUZL8ocpkn6ktjKi0+CP8=;
        b=vPdjO/FahGvwMpUscMV6HlsA7bQwvz8z4pG+0TqmsLHHKd61n+IrP0c3FxN9YUt052
         WZhjd34iVo7Z9XbK02Vary8h7GvqfCQ/n8kEMxTOX7vromQc9+PhmSVFMotrr3AM7Uml
         W4p+fC9R8/aiGZBH53q6+Mne2/6lVqHi5yK/Gop9KWp8h7nNVc0jlgwVJ+tww8d8XjIp
         TBDzZXXDRpN5bRC9lmsDIIf9M/dSDOm98Kh7wH1EjDKrZFhzu+RwAGOi0+inN4DBi7c9
         bFuqAJB0S0PPV4NW4eDkUBaBqBmXTl5RCttqeJP2SPhFvtieYnW+ymab6ANL2VVhPQX6
         /y4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=a2xmmeRndxEnZa1295uuokWUZL8ocpkn6ktjKi0+CP8=;
        b=b4lk/WWPiP9FKa47OJznAHgYGffWyezPtHHGHSllFRVwC4qC22tClZGpJZyIetlazB
         u+mZGXSKweK7UBymUiBtFVWcqY8nDxgRHL4Tk1ZKHHx9Egu3Ip7XSPAPGJE1HOW8Y9Z6
         cFEpcp4w1lsSK/x9q6jKeeL2+0Uno9L56fZqMZiUwI6pSmIHAAJYOrTUjVzhFL1opdtD
         6Y+/r1v5U227tFQFlgR6nwp9UPCd43Co+/qalorfBo/ZYwFPG+M1+I+6xpwMEaHtUnXY
         Z9OxaDpAm7U0C+hJUMTa4GKGDreHddTFxD34DqrFaiDn7MdX6z4j0zCk6EjimzZbdDbx
         iM1Q==
X-Gm-Message-State: APjAAAXAVBcqQkORYxsdLuzwZH9SRfEgiPDh4ZYHFOrSBfnz34XIh2cr
        HUXo7aj1239TbZ8bnuYykkc=
X-Google-Smtp-Source: APXvYqwxPrB+GW2h5nr7XOSCeIW7SYI73H+28mHUPkG/XxHFI6PW1bzGxQsFOU6sBfNd7ANr8Hmy1g==
X-Received: by 2002:a1c:730d:: with SMTP id d13mr16612403wmb.88.1560294399018;
        Tue, 11 Jun 2019 16:06:39 -0700 (PDT)
Received: from [192.168.2.202] (pD9E5A42E.dip0.t-ipconnect.de. [217.229.164.46])
        by smtp.gmail.com with ESMTPSA id f24sm2759973wmb.16.2019.06.11.16.06.37
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 16:06:38 -0700 (PDT)
Subject: Re: [RFC 0/2] Support for buttons on newer MS Surface devices
From:   Maximilian Luz <luzmaximilian@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Chen Yu <yu.c.chen@intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
References: <20190516142523.117978-1-luzmaximilian@gmail.com>
 <a0f93af3-c587-40d5-2a85-fdc0f9e6b79f@gmail.com>
Message-ID: <e8bb212c-9894-d244-4ee1-617df3952a53@gmail.com>
Date:   Wed, 12 Jun 2019 01:06:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <a0f93af3-c587-40d5-2a85-fdc0f9e6b79f@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Since there are no comments on this, should I simply submit this as patch?

Maximilian


On 6/1/19 9:07 PM, Maximilian Luz wrote:
> Hi,
> 
> any comments on this?
> 
> I should also mention that this has been tested via
> https://github.com/jakeday/linux-surface.
> 
> Maximilian
