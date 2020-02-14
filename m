Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35E6C15D6B8
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2020 12:44:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727754AbgBNLoq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Feb 2020 06:44:46 -0500
Received: from www149.your-server.de ([78.47.15.70]:54408 "EHLO
        www149.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726635AbgBNLoq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Feb 2020 06:44:46 -0500
X-Greylist: delayed 341 seconds by postgrey-1.27 at vger.kernel.org; Fri, 14 Feb 2020 06:44:45 EST
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hanno.de;
         s=default1911; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=MDhs0k5Hxjx7r04RR09T+FpIodHW2WaEwAQBV4p365k=; b=eWeiVeGrrohEGbZIMPZV1zgwXf
        P3ZKv5n6mt56MfBf6rkEaxoAdAKiw6mgtXddPz5TvnpzaawBJpJVX5EYyWS2UqoFUKspYgTdg6A6G
        DWOb3aufkjUBW1uPV9h59qO7SeZEnPIf+RAP+KMvUCCHl1LMqjr60Q5+j25pWao6PvfvhHoDbv2W6
        ad0FZPZLCbZFwB3maY8KwjqBtSxFQOzEGwKBDzrJKAdMx2WAhWCTqnQeqN8Z7bSpgV1neDpTkd4V6
        8oPHRy9LlaXu+fCVp77jYx86SZwTubbxk8AOMHyYcV+n0VcrtPaXl8PUALgqCLhgSvJWJoLzJTj48
        SagRHggQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
        by www149.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <abos@hanno.de>)
        id 1j2ZOj-0001ag-C2; Fri, 14 Feb 2020 12:44:41 +0100
Received: from [62.96.7.134] (helo=[10.1.0.41])
        by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <abos@hanno.de>)
        id 1j2ZOj-000OMQ-80; Fri, 14 Feb 2020 12:44:41 +0100
Subject: Re: hid-bigbenff general protection fault on unplug (Re: hid-sony
 kernel crash)
From:   Hanno Zulla <abos@hanno.de>
To:     Roderick Colenbrander <thunderbird2k@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     linux-input <linux-input@vger.kernel.org>
References: <CAEc3jaC0yJF7oYs1TK_zcrQ6_Er5sSBD41feC8GEjpDsBs9iLA@mail.gmail.com>
 <f61c212e-159e-b42c-bbab-ccf985e90975@hanno.de>
Message-ID: <272a035e-45cb-1281-4151-84ae4be5c6dc@hanno.de>
Date:   Fri, 14 Feb 2020 12:44:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <f61c212e-159e-b42c-bbab-ccf985e90975@hanno.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: abos@hanno.de
X-Virus-Scanned: Clear (ClamAV 0.102.1/25722/Thu Feb 13 12:45:05 2020)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi there,

> unplugging the BigBen gamepad supported by the hid-bigbenff driver 
> reliably leads to a general protection fault

Wanted to add - this is just caused by plugging in, unplugging and then 
waiting for the next memory allocation.

The GPF happens without rumble effects.

Kind regards,

Hanno
