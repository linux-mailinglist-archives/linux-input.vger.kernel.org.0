Return-Path: <linux-input+bounces-1300-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC2183144A
	for <lists+linux-input@lfdr.de>; Thu, 18 Jan 2024 09:14:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DE7F1F24971
	for <lists+linux-input@lfdr.de>; Thu, 18 Jan 2024 08:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93170BE7F;
	Thu, 18 Jan 2024 08:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c2vrkNzH"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4DC13AFB
	for <linux-input@vger.kernel.org>; Thu, 18 Jan 2024 08:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705565642; cv=none; b=ew+2ZVR7QQdz/6BSonJqUVYorqMRGU5Fon8kFte3xlGTcGXf6Vi5tq0qeORcp5+t3pLlEdNHy60sI6RjU2B8pCW9qQoiCvZI55xX/hUBvuvEKsSfHMKiqFD9eYzpoathCKv0d06xuz+5nC5nXD3cs2M7FmXQR68IS8zQ6C2v1B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705565642; c=relaxed/simple;
	bh=VAdc1NKbCLJXB5ZwNWmpBl+bYEPBUTw+cW5ZgUWrUe4=;
	h=DKIM-Signature:Received:X-MC-Unique:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Received:
	 X-Google-Smtp-Source:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding; b=MDZg2M/2e+nLIIlXKNIUcUpUj0JDRlTwVUBRJwmEg7ja8OpKO/S6rUd6CAIXd8mblLaMAAWrhJA2IQGx6BTJDVICkc32fKt51J12g3HHLsFx+RN2T3fkGvVwWNWIlM80pSFpBHpKO9MXkecB8JedfR8SMUSswie2B/O3b0daj40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c2vrkNzH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705565640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5SsqaeFnNlDjnwQj4dzfPpX8ZsfHI+luLg/Td8wcFQ4=;
	b=c2vrkNzHhDE91WQxnpsCO0/zCEk7WMSI0aTUEiVZcq2k0LTk80Auyc7S9vztZ0ruzeW01r
	JhXHRtUwd1cEh+Bpl2/7fUxeLwkv+vWPiis/HdM9yHvqkbOgJArwXR7qqnsA9tkNUoMkkV
	VoWwZ9jNYyfa3FPtrsxxpyDmNBe5puU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-CUb975pENP-JhkBfhqAzyw-1; Thu, 18 Jan 2024 03:13:58 -0500
X-MC-Unique: CUb975pENP-JhkBfhqAzyw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a2e66e65f6aso138945466b.2
        for <linux-input@vger.kernel.org>; Thu, 18 Jan 2024 00:13:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705565636; x=1706170436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5SsqaeFnNlDjnwQj4dzfPpX8ZsfHI+luLg/Td8wcFQ4=;
        b=ZqV3szN/Y6cNNQgAmLd2yYToiZDJLkaGEeV3xvrXDxtyK41OwSGbN6VXnQG76hWFQk
         bAPoN12hUYAp+0UD3Z7lLtnOtM9myCszx59iG6SuDl29MDRDlyjbgxPLV6cxpFIiTArT
         mk5MO0mBjwZ/jazYZ7pXBaZJRMxALGg+RiWDxBo4wbe5/EzsUHfASTjeCquPu9RwC7t9
         GaY+RpHoaGu6kMerNfvpoj7Q2joZsAKEFX+g1cv2Y8pwTjmx4DksGg0yJqdhxiyMN0fR
         5VlOEgcvddUQ5O1yUy6cUv4GEJg0EOxz2VRzOq37ukb/hQ8Blbq56Y67K0ZYEJFM35p+
         UJrw==
X-Gm-Message-State: AOJu0Yy64ypi4FG7Lz4jK//2YUejhkVnKioFOAZBAP922L7O1IeZIjOg
	7GimnSPKxlDCZGjV7OI+ezEJrj3/iYQWoBU7yD6XHlEGeQLVKIn6NXd+O5BjbxJ39fykdMBy5gj
	jclc97BVz2ilibPB9QPom1kCn1zHr8KBk3eDFtjA+roU2tZwP2LgPJH9BLiU/xk5dOGGWla1cOl
	g29+kyUkTLjKS9iyqE0sV+RX9nu94Mf953JMRuWz4WVuEnoQ==
X-Received: by 2002:a17:906:f746:b0:a26:97fe:b8cc with SMTP id jp6-20020a170906f74600b00a2697feb8ccmr266438ejb.66.1705565636469;
        Thu, 18 Jan 2024 00:13:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEC3cI8HvUGHgz6IrmlJYZMRWTXEOiyQ0Xwp7Yv8XXR/9cy35jOph4av3RGpi+WCBaGGtcY/I8OUZfAk0dVXVw=
X-Received: by 2002:a17:906:f746:b0:a26:97fe:b8cc with SMTP id
 jp6-20020a170906f74600b00a2697feb8ccmr266431ejb.66.1705565636180; Thu, 18 Jan
 2024 00:13:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240117-b4-wip-wacom-tests-fixes-v1-1-f317784f3c36@kernel.org> <CANRwn3QhYtuiGemwrf6_bYDDeAU0GrPm7T9ca3OzQaX8vGKPEQ@mail.gmail.com>
In-Reply-To: <CANRwn3QhYtuiGemwrf6_bYDDeAU0GrPm7T9ca3OzQaX8vGKPEQ@mail.gmail.com>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Thu, 18 Jan 2024 09:13:44 +0100
Message-ID: <CAO-hwJ+n7Bv8UgNaDCEtqoU=DWVxxVUJ7y+=nj_PKmrdtgorkA@mail.gmail.com>
Subject: Re: [PATCH] selftests/hid: wacom: fix confidence tests
To: Jason Gerecke <killertofu@gmail.com>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Jason Gerecke <jason.gerecke@wacom.com>, linux-input@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 7:12=E2=80=AFPM Jason Gerecke <killertofu@gmail.com=
> wrote:
>
> LGTM. Acked-by: Jason Gerecke <jason.gerecke@wacom.com>

Thanks!

I'll add a:
Fixes: b0fb904d074e ("HID: wacom: Add additional tests of confidence behavi=
or")

And send to Linus in the next round for 6.8 so we also fix the future
for-6.9 branches

Cheers,
Benjamin


>
>
> Jason
> ---
> Now instead of four in the eights place /
> you=E2=80=99ve got three, =E2=80=98Cause you added one  /
> (That is to say, eight) to the two,     /
> But you can=E2=80=99t take seven from three,    /
> So you look at the sixty-fours....
>
>
>
> On Wed, Jan 17, 2024 at 5:27=E2=80=AFAM Benjamin Tissoires <bentiss@kerne=
l.org> wrote:
>>
>> The device is exported with a fuzz of 4, meaning that the `+ t` here
>> is removed by the fuzz algorithm, making those tests failing.
>>
>> Not sure why, but when I run this locally it was passing, but not in the
>> VM.
>>
>> Link: https://gitlab.freedesktop.org/bentiss/hid/-/jobs/53692957#L3315
>> Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
>> ---
>> Over the break the test suite wasn't properly running on my runner,
>> and this small issue sneaked in.
>> ---
>>  tools/testing/selftests/hid/tests/test_wacom_generic.py | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/tools/testing/selftests/hid/tests/test_wacom_generic.py b/t=
ools/testing/selftests/hid/tests/test_wacom_generic.py
>> index 352fc39f3c6c..b62c7dba6777 100644
>> --- a/tools/testing/selftests/hid/tests/test_wacom_generic.py
>> +++ b/tools/testing/selftests/hid/tests/test_wacom_generic.py
>> @@ -880,8 +880,8 @@ class TestDTH2452Tablet(test_multitouch.BaseTest.Tes=
tMultitouch, TouchTabletTest
>>          does not overlap with other contacts. The value of `t` may be
>>          incremented over time to move the point along a linear path.
>>          """
>> -        x =3D 50 + 10 * contact_id + t
>> -        y =3D 100 + 100 * contact_id + t
>> +        x =3D 50 + 10 * contact_id + t * 11
>> +        y =3D 100 + 100 * contact_id + t * 11
>>          return test_multitouch.Touch(contact_id, x, y)
>>
>>      def make_contacts(self, n, t=3D0):
>> @@ -902,8 +902,8 @@ class TestDTH2452Tablet(test_multitouch.BaseTest.Tes=
tMultitouch, TouchTabletTest
>>          tracking_id =3D contact_ids.tracking_id
>>          slot_num =3D contact_ids.slot_num
>>
>> -        x =3D 50 + 10 * contact_id + t
>> -        y =3D 100 + 100 * contact_id + t
>> +        x =3D 50 + 10 * contact_id + t * 11
>> +        y =3D 100 + 100 * contact_id + t * 11
>>
>>          # If the data isn't supposed to be stored in any slots, there i=
s
>>          # nothing we can check for in the evdev stream.
>>
>> ---
>> base-commit: 80d5a73edcfbd1d8d6a4c2b755873c5d63a1ebd7
>> change-id: 20240117-b4-wip-wacom-tests-fixes-298b50bea47f
>>
>> Best regards,
>> --
>> Benjamin Tissoires <bentiss@kernel.org>
>>
>>


