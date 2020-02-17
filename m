Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D13BA161446
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2020 15:12:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727953AbgBQOMx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Feb 2020 09:12:53 -0500
Received: from www149.your-server.de ([78.47.15.70]:45186 "EHLO
        www149.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727898AbgBQOMx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Feb 2020 09:12:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hanno.de;
         s=default1911; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=A9dFEjO7USMU/ZVTOSFUAsBK+68fok0OXsA5Hi15Cq8=; b=jbcrscuiirfAuPVhC3UmeUoFC9
        vcLP0fPKgHYslVhtjlfqOH7Wcn4txTxh3yC6Zvx6KIy1Zu69o/HF+9hkZS7xzEf9N0IfmEYepT9E7
        g87l7OVLwsz/Y35dyPXLy9FrkL3c+7jcXpAduAWaQ3pjrL7tloop34hFiqBiQCxdjubZiEXdOW3ip
        6deftW1pldrYO6fBZFGOdqN2gPn+C6Sh8IFD17DaEe7VNGNP0dc8F2TC5Xt1qkWQw7U7zURyiGLRh
        GPcOI3U+Ji/lUmODUbmyLcRhEGbpOI44mKaJq2kTfV+KDHZZ46k1AMvSGfnIfWb/u/TM96BSTfOaq
        DVnUkOgQ==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
        by www149.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <abos@hanno.de>)
        id 1j3h8l-00013B-9I; Mon, 17 Feb 2020 15:12:51 +0100
Received: from [62.96.7.134] (helo=[10.1.0.41])
        by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <abos@hanno.de>)
        id 1j3h8l-00051l-6B; Mon, 17 Feb 2020 15:12:51 +0100
Subject: Re: hid-bigbenff general protection fault on unplug (Re: hid-sony
 kernel crash)
From:   Hanno Zulla <abos@hanno.de>
To:     Roderick Colenbrander <thunderbird2k@gmail.com>
Cc:     linux-input <linux-input@vger.kernel.org>
References: <CAEc3jaC0yJF7oYs1TK_zcrQ6_Er5sSBD41feC8GEjpDsBs9iLA@mail.gmail.com>
 <f61c212e-159e-b42c-bbab-ccf985e90975@hanno.de>
 <272a035e-45cb-1281-4151-84ae4be5c6dc@hanno.de>
Message-ID: <63e3a6b2-ebc4-d006-1f9c-8670d14494d6@hanno.de>
Date:   Mon, 17 Feb 2020 15:12:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <272a035e-45cb-1281-4151-84ae4be5c6dc@hanno.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: abos@hanno.de
X-Virus-Scanned: Clear (ClamAV 0.102.1/25725/Sun Feb 16 13:04:22 2020)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Roderick,

I found the bug, it's a double free.

 > Apparently, the resource cleanup in bigben_remove() is wrong in some
 > way. I wonder if this is somehow related to the problem Roderick
 > discussed below or possibly its original cause.

Just fyi, it's not related to the issue you described back in July about 
the Sony driver in Message-ID: 
<CAEc3jaC0yJF7oYs1TK_zcrQ6_Er5sSBD41feC8GEjpDsBs9iLA@mail.gmail.com>.

Will prepare a patch later.

Kind regards,

Hanno
